library my_project.globals;//kutuphane ve adı
List<Map<String, String>> favoriler = [];//burda ise favori listesine birden fazla şarkı eklemek için kullandım
final Map<String, List<Map<String, String>>> sarkilar = {
  "Mutlu": [
    {
      "isim": "poşet", 
      "url": "assets/music/poşet.mp3"
      },
      {
       "isim": "erik dalı", 
      "url": "assets/music/assets/music/erik_dalı.mp3" 
      }
    
  ],
  "Hüzünlü": [
    {
      "isim": "Evleniyormuşsun Bugün", 
      "url": "assets/music/bagsizlari_evleniyormussun_bugun.mp3.mp4" 
    },
    {
      "isim": "Yıldızsız Gecelerde", 
      "url": "assets/music/yildizsin_gecelerde.mp3.mp4"
    },
  ],
  "sakin":[
    {"isim":"seni kırmışlar yarim","url":"assets/music/seni_kırmışlar_yarim.mp3"},
   {"isim":"firuze","url":"assets/music/afiruze.mp3"}
  ],
  "enerjik":[
    {
      "isim":"erzurum halayları","url":"assets/music/erzurum_halayları.mp3"
    }
  ]
};
