# İşletim Sistemleri Final Ödevi

## Grup Üyeleri
Okan Yavuz <br>
Emre Şahin<br>
Muhammet Ali Yaşar<br>
Bilal Doğan İlaslan<br>
Kemal Emre Ayhan<br>
Hamza Küskü<br>
Dilara Güven

### Ödev Açıklaması

* Belgeler kısmını log klasörünün içine txt dosyası oluşturur.

* CPU %10 veya üstü olan işlemleri 3 saniye aralıklarla log dosyasına yazdırır.

* Eğer sadece idle dosyası CPU'su %10'u geçerse yazdırmaz. Yanında en az bir tane daha dosyanın CPU'su %10'u geçmesi lazım.

* If else %10 geçerse yazdırsın mı yazdırmasın mı mantığıyla kullandık.

* İşi oluşturduktan sonra tetikleyici sayesinde bir dakika sonra otomatik olarak başlatılacak.

* 'Register-ScheduledJob "MyJob" -Trigger $trigger -ScheduledJobOption $opt -ScriptBlock $action' kodu, işi oluşturur ve çalıştırır.

* 'Unregister-ScheduledJob -Name "MyJob" -Force' kodu, işi kaldırır.