import 'package:flutter/material.dart';//burda diğer açtığımız sayfalarla birleştirmek için import ettik
import'screens/mood.dart';
import'screens/liste.dart';
import 'screens/profil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => AnaEkranState();
}

class AnaEkranState extends State<AnaEkran> {
  int _selectedIndex = 0;//0 tanımlamamızın sebebi ana sayfayı 0 olarak algılaması
   static const List<Widget>sayfalar = <Widget>[//const değişmeyen yapı listeli sayfalar widget araç olarak tanımlanır
    AnaSayfa(),
    Liste(),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: sayfalar[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(//alt kısımda sabit kalacak iconları ayarlamak için bu komutu kullandım
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),//buraya verdiğim icon sayesinde menünün simgesini gösterir 
            label: 'Mood',//ana sayfa simgesi vermek için bu iconu kullandım
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),//liste simgesi vermek için bu iconu kullandım
            label: 'Liste',  
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),//profil simgesi  işareti vermek için bu iconu kullandım
            label: 'Profil',
          ),
        ],
        
        currentIndex: _selectedIndex,
        onTap: (index) {//ontap kullanma sebebimiz selectindexin her basısta değerini 1 arttırır
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
