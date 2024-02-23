// import 'dart:io';

// import 'package:Temelden/anasayfa.dart';
import 'package:Temelden/data_manager.dart';
import 'package:Temelden/main.dart';
import 'package:Temelden/screens/product/products_page.dart';
import 'package:Temelden/yazisayfasi.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// import 'package:path/path.dart';

class ProfilEkrani extends StatelessWidget {
  const ProfilEkrani({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROJELER',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 136, 16, 157),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: (() {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => Product()),
                    (Route<dynamic> route) => true);
              })),
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.black),
              onPressed: (() {
                FirebaseAuth.instance.signOut().then((deger) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Iskele()),
                      (Route<dynamic> route) => false);
                });
              }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => YaziEkrani()),
                (Route<dynamic> route) => true);
          })),
      body: Container(
        child: ProfilTasarimi(),
      ),
    );
  }
}

class ProfilTasarimi extends StatefulWidget {
  const ProfilTasarimi({super.key});

  @override
  State<ProfilTasarimi> createState() => _ProfilTasarimiState();
}

class _ProfilTasarimiState extends State<ProfilTasarimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FireStoreDataBase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              "Something went wrong",
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Image.network(
              snapshot.data.toString(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
