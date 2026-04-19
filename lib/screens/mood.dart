import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import '../globals.dart'; // Bu satır favoriler değişkenini buraya bağlar

void main() {
  runApp(const MuzikKesifApp());
}

class MuzikKesifApp extends StatelessWidget {
  const MuzikKesifApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moduna Göre Müzik',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const AnaEkranYonetici(),
    );
  }
}
class AnaEkranYonetici extends StatefulWidget {
  const AnaEkranYonetici({super.key});

  @override
  State<AnaEkranYonetici> createState() => _AnaEkranYoneticiState();
}

class _AnaEkranYoneticiState extends State<AnaEkranYonetici> {
  int _seciliSayfa = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> sayfalar = [
      const AnaSayfa(),
      const ListeSekmesi(),
      const Center(child: Text("Profil Sayfası")),//profil sayfasını adını ortalar
    ];

    return Scaffold(
      body: sayfalar[_seciliSayfa],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _seciliSayfa,
        onTap: (index) => setState(() => _seciliSayfa = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.theater_comedy), label: "Mood"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bugünkü Moodun"),
        backgroundColor: const Color.fromARGB(255, 105, 108, 111),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Nasıl Hissediyorsun?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),//nasıl hissediyorsun yazısının boyutunu ve sitilini elirledim
            ),
            const SizedBox(height: 40),//değişmeyen değer olarak emojilerin boyutunun yüksekliğini 40 yaptım
            Row(//yan yana getirmek için kullanılır
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _modKutusu(context, "Mutlu", "😊", Colors.orange),//burda ise mod kutularını verdim emojim gülen yüz altındaki yazıyıda mutlu yaptım
                _modKutusu(context, "Sakin", "🧘", Colors.lightBlueAccent),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _modKutusu(context, "Enerjik", "🔥", Colors.red),
                _modKutusu(context, "Hüzünlü", "😔", Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _modKutusu(BuildContext context, String modAd, String emoji, Color renk) {
    return GestureDetector(
      onTap: () {
        Navigator.push(//bu komutla sayfalar arası gezintiyi sağlar
          context,
          MaterialPageRoute(
            builder: (context) => ListeSayfasi(modAdi: modAd, anaRenk: renk),
          ),
        );
      },
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(20),//padding ile kutunun içindeki boşluğu ayarlamak için kullandım
        decoration: BoxDecoration(//decorasyon için kuullandım
          color: Colors.white,//rengini beyaz yaptım
          borderRadius: BorderRadius.circular(20),//tüm köşelerini eşit şekilde yuvarladım
          boxShadow: [BoxShadow(color: renk.withOpacity(0.3), blurRadius: 10)],
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 50)),
            const SizedBox(height: 10),
            Text(modAd, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

class ListeSayfasi extends StatefulWidget {
  final String modAdi;
  final Color anaRenk;
  const ListeSayfasi({super.key, required this.modAdi, required this.anaRenk});

  @override
  State<ListeSayfasi> createState() => _ListeSayfasiState();
}

class _ListeSayfasiState extends State<ListeSayfasi> {
  final Map<String, List<Map<String, String>>> sarkilar = {// burda şarkıları ekledim bilgisayardam aldığım içim assenst kullandım
    "Mutlu": [{"isim": "poşet", "url": "assets/music/poşet.mp3"},{"isim":"erik dalı","url":"assets/music/erik_dalı.mp3"}],
    "Sakin": [{"isim": "seni kırmışlar yarim", "url": "assets/music/seni_karmişlar_yarim.mp3"},{"isim":"firuze","url":"assets/music/firuze.mp3"}],
    "Enerjik": [{"isim": "erzurum halayları", "url": "assets/music/erzurum_halayları.mp3"}],
    "Hüzünlü": [{"isim": "Evleniyormuşsun Bugün", "url": "assets/music/bagsizlari_evleniyormussun_bugun.mp3"},{"isim":"yıldızsız gecelerden","url":"assets/music/yildizsin_gecelerde.mp3.mp4"}],
  };

  @override
  Widget build(BuildContext context) {
    final liste = sarkilar[widget.modAdi] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text("${widget.modAdi} Müzikleri"), backgroundColor: widget.anaRenk),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          final sarki = liste[index];
          bool favorideMi = favoriler.any((element) => element['isim'] == sarki['isim']);

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.music_note, color: widget.anaRenk),
              title: Text(sarki["isim"]!),
              trailing: IconButton(
                icon: Icon(
                  favorideMi ? Icons.favorite : Icons.favorite_border,
                  color: favorideMi ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    if (favorideMi) {
                      favoriler.removeWhere((element) => element['isim'] == sarki['isim']);
                    } else {
                      favoriler.add(sarki);
                    }
                  });
                },
              ),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfasi(sarkiAdi: sarki["isim"]!, url: sarki["url"]!))),
            ),
          );
        },
      ),
    );
  }
}

// --- 2. SEKMEYE GELECEK LİSTE SAYFASI ---
class ListeSekmesi extends StatelessWidget {
  const ListeSekmesi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Listeniz"), centerTitle: true),
      body: favoriler.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list, size: 100, color: Colors.blueGrey.shade200),
                  const SizedBox(height: 20),
                  const Text("Liste", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text("Listeniz şu an boş", style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriler.length,
              itemBuilder: (context, index) {
                final sarki = favoriler[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: Text(sarki["isim"]!),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfasi(sarkiAdi: sarki["isim"]!, url: sarki["url"]!))),
                  ),
                );
              },
            ),
    );
  }
}

// --- DETAY SAYFASI (MÜZİK ÇALAR) ---
class DetaySayfasi extends StatefulWidget {
  final String sarkiAdi;
  final String url;
  const DetaySayfasi({super.key, required this.sarkiAdi, required this.url});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  final player = AudioPlayer();
  bool caliyorMu = false;

  @override
  void initState() {
    super.initState();
    _hazirla();
  }


  Future<void> _hazirla() async {
    try {
      await player.setAsset(widget.url); //set asset komutunu internetsiz kullanmak için verdim await bekleme komutu anlamında kuullandım
    } catch (e) {
      print("Hata: Müzik dosyası bulunamadı! $e");
    }
  }

  void oynat() {
    player.play();
    setState(() => caliyorMu = true);//burda şart kosuyor çalısıyor mu çalısıyorsa devam ettir if else mantığı
  }

  void duraklat() {
    player.pause();
    setState(() => caliyorMu = false);//
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şimdi Çalıyor")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.music_video, size: 120, color: Colors.indigo),
            const SizedBox(height: 30),
            Text(widget.sarkiAdi, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            IconButton(
              icon: Icon(caliyorMu ? Icons.pause_circle : Icons.play_circle_fill, size: 80, color: Colors.indigo),
              onPressed: () => caliyorMu ? duraklat() : oynat(),
            ),
          ],
        ),
      ),
    );
  }
}