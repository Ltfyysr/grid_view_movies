import 'package:filmler_uygulamasi/colors.dart';
import 'package:filmler_uygulamasi/filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfasi extends StatefulWidget {
  Filmler film;

  DetaySayfasi({required this.film});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  bool favoriteButton = true;

  @override
  Widget build(BuildContext context) {
    var f = widget.film;
    return Scaffold(
      appBar: AppBar(
        title: Text(f.filmAd),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: favoriteButton
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          favoriteButton = false;

                        });
                        print("favorilere eklendi ");
                      },
                      icon: Icon(Icons.favorite_border_outlined))
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          favoriteButton = true;

                        });
                        print("favorilerden kaldırıldı");

                      },
                      icon: Icon(Icons.favorite,color: Colors.red))

              /* IconButton(onPressed: (){
              setState((){
                Icon(Icons.favorite,color: Colors.red);
              });
            },icon: Icon(Icons.favorite_border_outlined)),*/
              ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${f.filmResimAd}"),
            Text(
              "${f.filmFiyat} ₺",
              style: const TextStyle(fontSize: 30, color: Colors.teal),
            ),
            ElevatedButton(
              onPressed: () {
                print("${f.filmAd} kiralandı.");
              },
              child: Text("KİRALA", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: buttonRenk,
                minimumSize: const Size(200, 50),
                maximumSize: const Size(200, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
