import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // telefon numarasında sadece rakam girilmesini istediğim için bu içeri aktarmayı kullandım
class Profil extends StatefulWidget { // profil sınıfını tanımladım
  const Profil({super.key});

  @override
  State<Profil> createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  bool oturumAcildiMi = false;//burda bool fonksiyonu ile oturum açık mı değil mi kotrolü yapıyorum false olduğu için oturum kapalı şu gözüküyor burda
  String resimLink = "https://picsum.photos/id/1/200";
  

  String secilenCinsiyet = "Belirtilmedi"; //kullanıcının seçme işlemi yapması için bu komutu kullandım
  TextEditingController adKontrol = TextEditingController();//burda ise profil bilgilerinde ad girilmiş mi diye kontrol ediyor 
  TextEditingController mailKontrol = TextEditingController();//burda ise mail bilgilerinde ad girilmiş mi diye kontrol ediyor 
  TextEditingController telefonnumarasi = TextEditingController();//burda ise telefon bilgilerinde ad girilmiş mi diye kontrol ediyor 
  TextEditingController ruhhali = TextEditingController();//burda ise telefon bilgilerinde ad girilmiş mi diye kontrol ediyor 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(oturumAcildiMi ? "Profilim" : "Oturum Aç"),//burda ise profil sekmesine başlık verdim oturum aç diye
        backgroundColor: const Color.fromARGB(255, 105, 108, 111),//burda ise oturum aç başlığının arka plan rengini değiştirdim
       
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),//yazının kenarlığa boşluk oranı 20 diye ayarladım const ile değişmez değer verdim
                    child: Column(
            children: [
              CircleAvatar(
                radius: 50,//borderradius tüm kenarları ovallestirirken radius tek kenarı ovalleştirir 
                backgroundImage: NetworkImage(resimLink),// Profil resmi için internetten görsel yükler
              ),
              const SizedBox(height: 10),//kutuların yüksekliğini 10 olarak ayarladım
              if (!oturumAcildiMi)//burda if ifadesiyle şart kosuyorum oturum acıldımı diye
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => resimLink = "https://picsum.photos/id/10/200"),//2 adet resim kurdum değiştirmek için bu komutu kullandım istediğimiz resmi seçmek için
                      child: CircleAvatar(radius: 15, backgroundImage: NetworkImage("https://picsum.photos/id/10/200")),//profil olarak gormek istediğimiz resmi yapmak için bu komutu kullandım
                    ),
                    const SizedBox(width: 10),//sizebox kutunun genişliğini 10 olarak ayarladım
                    GestureDetector(
                      onTap: () => setState(() => resimLink = "https://picsum.photos/id/20/200"),
                      child: CircleAvatar(radius: 15, backgroundImage: NetworkImage("https://picsum.photos/id/20/200")),
                    ),
                  ],
                ),
              
              const SizedBox(height: 30),
              
              if (!oturumAcildiMi)//burda tekrar şart kuruyor if yapısıyla
                Column(
                  children: [
                    TextField(
                      controller: adKontrol,//burda ad kontrolü yapıyor yazılmış mı yazılmamış mı diye
                      decoration: const InputDecoration(labelText: "Ad Soyad", border: OutlineInputBorder()),//decorasyonun değişmeyen yapısı olarak verdim komutu sonra labeltext içinde gözükmesini istediğim kelimeyi yazdım
                    ),
                    const SizedBox(height: 15),//const değişmeyen yapı kutunun yuksekliğini 15 olarak ayarladım
                    TextField(
                      controller: mailKontrol,//ad kontrolde yaptıgım aynı işemleri burdada yaptım kopya yapıştırla
                      decoration: const InputDecoration(labelText: "E-mail", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 15),

                    // burdan sonra cinsiyeti ele yazmak yerine seçi yapılmasını istedim bu yüzden aşağıdaki komutları yaptım
                    const Text("Cinsiyetiniz:", style: TextStyle(fontWeight: FontWeight.bold)),//burada ise yazının stilini şeklini ve kalınlığını ayarladım
                    const SizedBox(height: 10),//buradada kutunun yüksekliğini ayarladım 10 olarak
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,//her taraftan eşit olarak boşluk bırakır bu komutlar
                      children: [
                    
                        GestureDetector(
                          onTap: () => setState(() => secilenCinsiyet = "Kız"),//setstate ekranı gunceller,ontype seçim yapılacagını algılar ve burda seçilen cinseyet kız ise diye komutunu yazdım
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: secilenCinsiyet == "Kız" ? Colors.pink[100] : Colors.grey[200],//burda kutuların rengi gri eğer seçimde kız olursa kutunun rengini pembe olacak şekilde komut verdim burda [] içinde verdiğim değerler ton bilgisi
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: secilenCinsiyet == "Kız" ? Colors.pink : Colors.transparent),//burda ise kenarlık üzerinde çalışma yaptım eğer ki seçimin kız ise kenarlığı pembe yap değil ise kenarlık olması
                            ),
                            child: const Text("Kız"),
                          ),
                        ),
                        //kız seçimi için ne yaptıysam aynısını erkek buttonu içinde yaptım 
                        GestureDetector(
                          onTap: () => setState(() => secilenCinsiyet = "Erkek"),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: secilenCinsiyet == "Erkek" ? Colors.blue[100] : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: secilenCinsiyet == "Erkek" ? Colors.blue : Colors.transparent),
                            ),
                            child: const Text("Erkek"),
                          ),
                        ),
                        //kız seçimi için ne yaptıysam aynısını belirtmek istemiyorum buttonu içinde yaptım 
                        GestureDetector(
                          onTap: () => setState(() => secilenCinsiyet = "Belirtmek İstemiyorum"),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: secilenCinsiyet == "Belirtmek İstemiyorum" ? Colors.grey[400] : Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: secilenCinsiyet == "Belirtmek İstemiyorum" ? Colors.black : Colors.transparent),
                            ),
                            child: const Text("Belirtmek İstemiyorum"),
                          ),
                        ),
                      ],
                    ),
                    //burdaki amacım ise tlf numarası kısmına sadece rakam girilsin ve 11 hane olucak şekilde
                    const SizedBox(height: 20),
                    TextField(
                   controller: telefonnumarasi,//burda ise telefon numarası kontolu yapmasını istedim
                 keyboardType: TextInputType.number, //kullanıcıdan tlf numarası girilmesini istedim
                  maxLength: 11,//max uzunluğu 11 olsun dedim fazlasını girmesin
  
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Sadece rakam girilmesine izin verdim ki harf giremezsin
                 ],
                   decoration: const InputDecoration(//decorasyon verdim const ile decoration değişmeyecek sekilde ayarladım
                   labelText: "Telefon Numarası ",//telefon numarası yazısı gözükecek girilmesi için
                    border: OutlineInputBorder(),
                   //counterText: "", 
                    ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: ruhhali,
                      decoration: const InputDecoration(labelText: "Ruh Hali", border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                    
                    onPressed: () {
              // Burada kontrol yapıyoruz: E-posta @gmail.com ile mi bitiyor?
                  if (mailKontrol.text.endsWith("@gmail.com")) {
                     setState(() {
                      oturumAcildiMi = true; // Şart doğruysa oturumu aç
                   });
                   } else {
                         // Şart yanlışsa ekranın altında kırmızı bir uyarı göster
                         ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                               content: Text("Hata: Sadece @gmail.com uzantılı adresler kabul edilir!"),
                          backgroundColor: Colors.red,
                           ),
                           );
                            }
                                 },
                      child: const Text("Kaydet ve Oturumu Aç"),//burda giriş yapmak için button koydum
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified, color: Colors.green),
                        const SizedBox(width: 10),
                        Text("Hoş geldin, ${adKontrol.text}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),//$ metin içindeki değişkenler için kullanılır
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text("E-posta: ${mailKontrol.text}"),
                    Text("Telefon: ${telefonnumarasi.text}"),
                    Text("Cinsiyet: $secilenCinsiyet"), 
                    Text("Şu anki Ruh Halim: ${ruhhali.text}"),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     // Icon(Icons.star, color: Colors.amber),
                       // SizedBox(width: 10),
                        //Text("Şanslı Modun: Enerjik"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          oturumAcildiMi = false;
                        });
                      },
                      child: const Text("Bilgileri Düzenle / Çıkış"),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}