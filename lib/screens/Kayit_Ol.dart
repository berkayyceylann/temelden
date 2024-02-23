import 'package:Temelden/firebase_options.dart';
import 'package:Temelden/main.dart';
import 'package:Temelden/screens/product/products_page.dart';
// import 'package:Temelden/screens/profilsayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:passwordfield/passwordfield.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KayitOl(),
      builder: EasyLoading.init(),
    );
  }
}

class KayitOl extends StatefulWidget {
  const KayitOl({super.key});

  @override
  State<KayitOl> createState() => _IskeleState();
}

class _IskeleState extends State<KayitOl> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
                //     child: Image(
                //         image: AssetImage("images/logo.jpg"),
                //         width: 600,
                //         height: 200)),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   child: TextField(
                //     controller: t1,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(90.0),
                //           borderSide: BorderSide(color: Colors.purple)),
                //       labelText: 'Email',
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                //   child: TextField(
                //     controller: t2,
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       suffixIcon: IconButton(
                //         icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                //         padding:
                //             EdgeInsets.only(bottom: 0, left: 30, right: 30),
                //         onPressed: () {},
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(90.0),
                //       ),
                //       labelText: 'Password',
                //     ),
                //   ),
                // ),
                Container(
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: Colors.yellow[700]),
                      child: const Text('Kayıt Ol'),
                      onPressed: kayitOl,
                    )),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.home, color: Colors.black),
                    onPressed: (() {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => Iskele()),
                          (Route<dynamic> route) => true);
                    })),
                Text("ANA SAYFA"),
              ]),
        ),
      ),
    );
  }

  @override
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  bool invisible = true;

  Future<void> kayitOl() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => Iskele()), //degistir
          (Route<dynamic> route) => false);
      FirebaseFirestore.instance.collection("Kullanicilar").doc(t1.text).set(
        {"KullaniciEposta": t1.text, "KullaniciSifre": t2.text},
      );
    });
  }

  void girisYap() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((kullanici) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => Product()),
          (Route<dynamic> route) => false);
    });
  }

  var gelenYaziBasligi = "";
  var gelenYaziIcerigi = "";

  void YaziEkle() {
    FirebaseFirestore.instance
        .collection("Yazilarr")
        .doc(t1.text)
        .set({'baslik': t1.text, 'icerik': t2.text});
  }

  void YaziGuncelle() {
    FirebaseFirestore.instance
        .collection("Yazilarr")
        .doc(t1.text)
        .update({'baslik': t1.text, 'icerik': t2.text});
  }

  void YaziSil() {
    FirebaseFirestore.instance.collection("Yazilarr").doc(t1.text).delete();
  }

  void YaziGetir() {
    FirebaseFirestore.instance
        .collection("Yazilarr")
        .doc(t1.text)
        .get()
        .then((gelenveri) {
      setState(() {
        gelenYaziIcerigi = gelenveri['icerik'];
        gelenYaziBasligi = gelenveri['baslik'];
      });
    });
  }
}
