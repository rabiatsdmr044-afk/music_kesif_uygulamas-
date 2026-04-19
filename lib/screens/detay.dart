import 'package:flutter/material.dart';
import '../globals.dart'; // listeyi burdan aldığım için bunu ekledim
class FavorilerSayfasi extends StatelessWidget {
  const FavorilerSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoriler ❤️")),//liste sayfasına yazılacak metini ❤️ işaretiyle belirtir
      body: favoriler.isEmpty
          ? const Center(child: Text("Henüz favori yok"))//eğerki bişey yoksa metni ortalayarak metini iletir
          : ListView.builder(
              itemCount: favoriler.length,
              itemBuilder: (context, index) {
                final sarki = favoriler[index];

                return ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: Text(sarki["isim"]!),
                );
              },
            ),
    );
  }
}