import 'package:filmler_uygulamasi/colors.dart';
import 'package:filmler_uygulamasi/film_detay_sayfa.dart';
import 'package:filmler_uygulamasi/filmler.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Filmler>> filmleriGetir() async {
    var filmListesi = <Filmler>[];
    var f1 = Filmler(
        filmId: 1,
        filmAd: "Anadoluda",
        filmResimAd: "anadoluda.png",
        filmFiyat: 15.99);
    var f2 = Filmler(
        filmId: 2,
        filmAd: "Django",
        filmResimAd: "django.png",
        filmFiyat: 9.99);
    var f3 = Filmler(
        filmId: 3,
        filmAd: "Inception",
        filmResimAd: "inception.png",
        filmFiyat: 5.99);
    var f4 = Filmler(
        filmId: 4,
        filmAd: "Interstellar",
        filmResimAd: "interstellar.png",
        filmFiyat: 21.99);
    var f5 = Filmler(
        filmId: 5,
        filmAd: "The Hateful Eight",
        filmResimAd: "thehatefuleight.png",
        filmFiyat: 8.99);
    var f6 = Filmler(
        filmId: 6,
        filmAd: "The Pianist",
        filmResimAd: "thepianist.png",
        filmFiyat: 7.99);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filmler"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            ),
          ],
        ),
        body: FutureBuilder<List<Filmler>>(
            future: filmleriGetir(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var filmListesi = snapshot.data;
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 2 / 3.5),
                    itemCount: filmListesi!.length,
                    itemBuilder: (context, index) {
                      var film = filmListesi[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetaySayfasi(film: film)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("resimler/${film.filmResimAd}"),
                                Text(
                                  film.filmAd,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("${film.filmFiyat} ₺",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.teal)),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center();
              }
            }),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giriş Yap/Hesap Oluştur",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            decoration: BoxDecoration(color: anaRenk),
          ),
        ])));
  }
}
