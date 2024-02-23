// import 'package:Temelden/firebase_options.dart';
// import 'package:Temelden/main.dart';
import 'package:Temelden/screens/product/products_page.dart';
// import 'package:Temelden/screens/profilsayfasi.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class YaziEkrani extends StatefulWidget {
  const YaziEkrani({super.key});

  @override
  State<YaziEkrani> createState() => _YaziEkraniState();
}

class _YaziEkraniState extends State<YaziEkrani> {
  @override
  // TextEditingController t1 = TextEditingController();
  // TextEditingController t2 = TextEditingController();
  // TextEditingController t3 = TextEditingController();

  // Future<void> kayitOl() async {
  //   await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
  //       .then((kullanici) {
  //     FirebaseFirestore.instance
  //         .collection("Kullanicilar")
  //         .doc(t1.text)
  //         .set({"KullaniciEposta": t1.text, "KullaniciSifre": t2.text});
  //   });
  // }

  // void girisYap() {
  //   FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: t1.text, password: t2.text)
  //       .then((kullanici) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (_) => ProfilEkrani()),
  //         (Route<dynamic> route) => false);
  //   });
  // }

  // var gelenYaziBasligi = "";
  // var gelenYaziIcerigi = "";

  // var currentUser = FirebaseAuth.instance.currentUser;

  // void YaziEkle() {
  //   FirebaseFirestore.instance.collection("Yazilarr").doc(t1.text).set({
  //     'kullaniciid': currentUser!.uid,
  //     'baslik': t1.text,
  //     'icerik': t2.text,
  //   });
  // }

  // void YaziGuncelle() {
  //   FirebaseFirestore.instance
  //       .collection("Yazilarr")
  //       .doc(t1.text)
  //       .update({'baslik': t1.text, 'icerik': t2.text});
  // }

  // void YaziSil() {
  //   FirebaseFirestore.instance.collection("Yazilarr").doc(t1.text).delete();
  // }

  // void YaziGetir() {
  //   FirebaseFirestore.instance
  //       .collection("Yazilarr")
  //       .doc(t1.text)
  //       .get()
  //       .then((gelenveri) {
  //     setState(() {
  //       gelenYaziIcerigi = gelenveri['icerik'];
  //       gelenYaziBasligi = gelenveri['baslik'];
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TEMELDEN.COM", //appbar yapabilirsiniz
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.yellow[700],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                "HAKKIMIZDA",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                child: Image(
                    image: AssetImage("../images/logo.jpg"),
                    width: 200,
                    height: 250),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 5, 15),
                child: Text(
                  "Temelden.com şirketi, müşterilerini memnun etmek için her zaman en kaliteli tedarikçiler en itibarli çözüm ortakları ile çalışmaktatır.İhtiyaçlarına göre müşterilere uygun projeleri müşterilerle buluşturmayı kendine misyon edinmiştir.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            ]),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.grey[800],
                ),
                onPressed: () {
                  setState(() {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Product()),
                        (Route<dynamic> route) => false);
                  });
                },
              ),
              // IconButton(
              //     icon: Icon(
              //       Icons.logout,
              //       size: 40,
              //       color: Colors.grey[800],
              //     ),
              //     onPressed: (() {
              //       Navigator.pushAndRemoveUntil(
              //           context,
              //           MaterialPageRoute(builder: (_) => Iskele()),
              //           (Route<dynamic> route) => false);
              //     })),
            ]),
      )),
    );
  }
}
