// import 'package:Temelden/data_manager.dart';
import 'package:Temelden/main.dart';
import 'package:Temelden/screens/City/istanbul.dart';
import 'package:Temelden/screens/City/izmir.dart';
import 'package:Temelden/screens/product/detail_product.dart';
import 'package:Temelden/yazisayfasi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// enum ProductTypeEnum { Donwloadable, Deliverable }

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // ProductTypeEnum? _productTypeEnum;

  String name = '';
  bool isFavourite = false;

  // int _selectedIndex = 0;
  final screens = [
    Product(),
    Iskele(),
    Product(),
    Iskele(),
  ];
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Products').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    isFavourite = !isFavourite;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Product()),
                        (Route<dynamic> route) => false);
                  });
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey[800],
                  ),
                  onPressed: (() {
                    setState(() {
                      isFavourite = !isFavourite;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => YaziEkrani()),
                          (Route<dynamic> route) => false);
                    });
                  })),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(children: <Widget>[
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.yellow[700], //background color of button
                            side: BorderSide(
                                width: 3,
                                color: Colors.yellow), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(
                                20) //content padding inside button
                            ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Istanbul()),
                              (Route<dynamic> route) =>
                                  false); //code to execute when this button is pressed.
                        },
                        child: Text("  İSTANBUL  ")),
                  ]),
                  Column(children: <Widget>[
                    const SizedBox(height: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.yellow[700], //background color of button
                            side: BorderSide(
                                width: 3,
                                color: Colors.yellow), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(
                                20) //content padding inside button
                            ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => Izmir()),
                              (Route<dynamic> route) =>
                                  false); //code to execute when this button is pressed.
                        },
                        child: Text("     İZMİR     ")),
                  ]),
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),

              // TextFormField
              // (
              //   onChanged: (Text) {
              //     SeacrhMethod(Text);
              //   },
              //   decoration: InputDecoration(
              //       hintText: 'Search Here',
              //       contentPadding: EdgeInsets.symmetric(horizontal: 10),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),

              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),

              //       suffixIcon: Container(
              //           height: 60,
              //           width: 60,
              //           decoration: const BoxDecoration(
              //               color: Colors.black,
              //               borderRadius: BorderRadius.only(
              //                 topRight: Radius.circular(25),
              //                 bottomRight: Radius.circular(25),
              //               )),
              //           child: IconButton(
              //             icon: Icon(
              //               Icons.search,
              //               color: Colors.white,
              //             ),
              //             onPressed: () {},
              //           ))),
              // ),

              const SizedBox(
                height: 25,
              ),
              Text("PROJELER",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 25,
              ),

              StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  return Expanded(
                    child: AlignedGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(productId: data.id)));
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(data['image']),
                                      fit: BoxFit.cover),
                                  color: Color.fromARGB(255, 91, 91, 91),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                data['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                data['city'],
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeHome() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => Iskele()),
        (Route<dynamic> route) => false);
  }
}

// void SeacrhMethod(String text) {
//   Reference reference =
//       FirebaseFirestore.instance.collection('Products') as Reference;
// }
