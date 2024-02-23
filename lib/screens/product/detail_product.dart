// import 'package:Temelden/screens/product/products_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String productId;
  const ProductDetail({super.key, required this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  CollectionReference productdetail =
      FirebaseFirestore.instance.collection('Products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TEMELDEN.COM",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.yellow[700],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: productdetail.doc(widget.productId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(borderRadius: BorderRadius.circular(50)),
                    Image.network(
                      data['image'],
                      height: 250,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "PROJE BİLGİLERİ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Projenin Adı:   " + data['name'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Proje Tipi:   " + data['KonutTipi'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Konut Sayısı:   " + data['KonutSayisi'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Arsa Alanı:   " + data['ArsaAlani'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Konut Tipleri:   " + data['KonutTipi'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Metrekare Alani:   " + data['Metrekare Alani'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Teslim Tarihi:   " + data['TeslimTarihi'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Satış Durumu:   " + data['SatisDurumu'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Adres:   " + data['address'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Açıklama:   " + data['explain'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "İletişim:   " + data['iletisim'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
