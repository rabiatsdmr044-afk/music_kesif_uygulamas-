import 'package:flutter/material.dart';
// BURASI ÇOK ÖNEMLİ: favoriler listesine erişmek için main'i içeri alıyoruz
import '../main.dart'; 
// Eğer mood.dart içindeki DetaySayfasi'na gitmek istiyorsan:
import 'mood.dart'; 
import 'package:flutter/material.dart';
import '../globals.dart';

class Liste extends StatelessWidget {
  const Liste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favori Listem")),
      body: favoriler.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.format_list_bulleted, size: 80, color: Colors.blueGrey),
                  const SizedBox(height: 20),
                  const Text('Liste', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 10),
                  Text('Listeniz şu an boş', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriler.length,
              itemBuilder: (context, index) {
                final sarki = favoriler[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: const Icon(Icons.favorite, color: Colors.red),
                    title: Text(sarki["isim"]!),
                    trailing: const Icon(Icons.play_arrow),
                    onTap: () {
                      // Mood sayfasındaki DetaySayfasi'na gönderiyoruz
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetaySayfasi(
                            sarkiAdi: sarki["isim"]!,
                            url: sarki["url"]!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}