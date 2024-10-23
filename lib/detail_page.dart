import 'package:flutter/material.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';

class DetailPage extends StatelessWidget{
final Makanan makanan;

  DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pageBgColor,
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Stack(
              children: [Image.asset(makanan.gambarUtama, scale: 0.5),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ButtonBack(), ButtonLike()
                  ],
                ),
              )],
            ),
            Container(
              color: headBgColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(makanan.nama, 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                attributesIcon(Icons.access_time_filled, makanan.waktuBuka),
                attributesIcon(Icons.local_fire_department, makanan.kalori),
                attributesIcon(Icons.monetization_on, makanan.harga),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(makanan.detail, 
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
              ),
            ),
            listGambarLain(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Bahan - bahan :", style: headerH1)),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: makanan.bahan.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [Image.asset(makanan.bahan[index].values.first,
                      width: 52),
                      Text(makanan.bahan[index].keys.first)
                      ],
                    ),
                  );
                }),
            )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listGambarLain() {
    return SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: makanan.gambarLain.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(makanan.gambarLain[index])),
              );
            }),
          );
  }

  Column attributesIcon(IconData icon, String teks) {
    return Column(
                children: [
                  Icon(icon, color: iconColor),
                Text(
                  teks, 
                  style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded, 
          color: Colors.white
          ),
      ),
    );
  }
}

class ButtonLike extends StatefulWidget {
  const ButtonLike({
    super.key,
  });
  
  @override
  State<StatefulWidget> createState() => _ButtonLike();
}

class _ButtonLike extends State<ButtonLike>{
  bool isLiked = false; // Mengubah nama variabel agar lebih deskriptif

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey, // Warna latar belakang tombol
      child: IconButton(
        onPressed: (){
          setState(() {
            isLiked = !isLiked; // Mengubah status like
          });
        },
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_outline, // Mengubah ikon sesuai status
          color: isLiked ? Colors.red : Colors.white, // Ganti warna saat like
        ),
      ),
    );
  }
}
