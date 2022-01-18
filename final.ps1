$action =
    {
        $cpu = 10;
        $saniye = 3
        $logPath = "Log/"
        for (;;)
        {
            $tmp = Get-WmiObject Win32_PerfFormattedData_PerfProc_Process |
            select-object -property Name, @{Name = "CPU"; Expression = {($_.PercentProcessorTime/ (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors)}} |
            Where-Object {($_.Name -notmatch "^(idle|_total|system)$") -and ($_.CPU -GE $cpu)} |
            Sort-Object -Property CPU -Descending;
            New-Item -ItemType Directory -Force -Path $logPath
            $name = (get-date).tostring("yyyy-MM-dd")
            If ($tmp.count -gt 0) {
                 "%" + $cpu + " CPU kullanımını geçen uygulamalar:" + [Environment]::NewLine + (get-date).tostring("HH:mm:ss")  >> ($logPath + $name + ".log")
                $tmp | Format-Table -Autosize -Property Name, CPU >> ($logPath + $name + ".log")
            }else{
                "%" + $cpu+ " kullanımını geçen uygulama yok." + [Environment]::NewLine + (get-date).tostring("HH:mm:ss") >> ($logPath + $name + ".log")
            }
            Start-Sleep -Seconds $saniye
        }
    }

$trigger = New-JobTrigger -At "16/01/2022 23:00" -RepetitionInterval (New-TimeSpan -Minutes 1) -RepeatIndefinitely $true

$opt = New-ScheduledJobOption -RunElevated -RequireNetwork

Register-ScheduledJob "MyJob" -Trigger $trigger -ScheduledJobOption $opt -ScriptBlock $action

Unregister-ScheduledJob -Name "MyJob" -Force

