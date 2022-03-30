import 'package:flutter/material.dart';

class Food {
  String name;
  String desc;
  String recipe;
  String? image;
  bool favorite;
  String time;

  Food({
    required this.name,
    required this.desc,
    required this.recipe,
    required this.favorite,
    this.image,
    this.time = 'siang',
  });
}

List<Food> pagi = foodList.where((foods) => foods.time == 'pagi').toList();
List<Food> siang = foodList.where((foods) => foods.time == 'siang').toList();
List<Food> malam = foodList.where((foods) => foods.time == 'malam').toList();

var foodList = [
  Food(
      favorite: true,
      name: 'Nasi Goreng',
      desc:
          'Resep nasi goreng jawa ini memakai bumbu halus yang terdiri dari cabai merah, bawang putih, bawang merah, ketumbar, dan terasi. Sebagai pelengkap bisa ditambahkan protein seperti telur, ayam suwir, ataupun daging',
      recipe:
          '500 gram nasi putih  200 gram daging sapi rebus, potong panjang tipis (bisa diganti ayam suwir) 10 gram udang basah, kupas kulitnya (opsional) 2 sdm kecap manis  2 sdm minyak goreng untuk menumis  3 sdm air matang',
      image: 'images/nasGor.jpg',
      time: 'pagi'),
  Food(
      favorite: true,
      name: 'Ayam gulai',
      desc:
          'Gulai merupakan salah satu jenis masakan yang popular di Indonesia dan di Malaysia. Meskipun sudah menyebar ke berbagai daerah, makanan ini disebut-sebut asli berasal dari Sumatra.',
      recipe:
          'Ayam, potong jadi 10 bagian - 1 ekor Santan, dari 1/2 butir kelapa - 300 ml Santan encer - 700 ml Daun kunyit, simpulkan - 1 lembar Daun jeruk, sobek - 3 lembar Daun salam - 2 lembar Asam kandis - 1 buah',
      image: 'images/ayam.jpg',
      time: 'siang'),
  Food(
      name: 'Bakso',
      desc:
          'Cara membuat bakso cukup simpel. Namun, supaya tekstur kenyal dan membal, sebaiknya tambahkan baking powder pada bahannya.  Untuk kuahnya sendiri bisa dimasak menggunakan sisa tetelan daging dan tulang sapi. Penggunaan dua bahan ini dapat membuat rasa kuah bakso lebih gurih dan enak.',
      recipe:
          '500 gr Daging bagian sengkel dalam keadaan dingin ( potong kecil) 100 gr Es batu 100 gr Tepung sagu 2 sdm Bawang merah goreng 1 sdm Bawang putih goreng 1 Butir putih telur ukuran besar ½ sdt Garam ½ sdt Lada bubuk ½ sdt Kaldu bubuk 1 sdt Baking powder',
      image: 'images/bakso.jpg',
      time: 'malam',
      favorite: true),
  Food(
      name: 'Rendang',
      desc:
          'Rendang merupakan salah satu masakan Indonesia yang terkenal akan kelezatannya. Rendang adalah masakan daging yang berasal dari Minangkabau Sumatra Barat Indonesia. Proses memasak rendang dengan suhu rendah dalam waktu lama, menggunakan santan dan aneka rempah-rempah khas indonesia yang sedikit pedas sehingga menambah ke khas an dan kelezatannya.',
      recipe:
          '1 kg daging sapi bagian paha atau gandik, 1 kg santan kental dari 4butir kelapa, 2 kg santan cair 200 gr bawang mera 8 siung bawang putih 250 gram cabe merah 1 bh pala 5 cm jahe 2 sdm ketumbar 6 btr cengkeh',
      image: 'images/rendang.jpg',
      time: 'siang',
      favorite: false),
  Food(
      name: 'Mie Ayam',
      desc:
          'Sajian mie ayam termasuk menu jajanan kaki lima yang sangat populer di berbagai daerah. Masing-masing daerah punya racikan mie ayam khas. Misalnya saja mie ayam Solo, Jakarta, dan Wonogiri.',
      recipe:
          '1/2 kg Mie ayam telur (siap jadi), 100 ml Minyak ayam, 100 ml Kecap asin,300 gr Daging ayam (rebus lalu potong kotak2),3 sdm Kecap manis',
      favorite: false,
      image: 'images/mie.jpg',
      time: 'malam'),
  Food(
      name: 'Bubur Ayam',
      desc:
          'Bubur Ayam Kuning merupakan menu khas untuk makan pagi orang Indonesia yang sangat legendaris. Meskipun banyak versi, tapi yang satu ini dipastikan merajai jalanan kota Jakarta sedari sinar mentari masih malu-malu bersinar.',
      recipe:
          '500 g daging ayam, rebus dengan 2 L air, 250 g beras, cuci bersih ,2 lembar daun salam, 2 garam, 1 L kaldu ayam',
      favorite: false,
      image: 'images/buryam.jpg',
      time: 'pagi')
];

void create(name, desc, recipe, favorite) {
  var newFood = <Food>[
    Food(name: name, desc: desc, recipe: recipe, favorite: favorite)
  ];
  foodList.addAll(newFood);
}
