import 'dart:math';
import 'dart:ui';
import 'package:dapur_aja/detail.dart';

import 'package:flutter/material.dart';
import 'function/time.dart';
import 'package:dapur_aja/models/foods.dart';
import 'package:dapur_aja/listFood.dart';
import 'package:dapur_aja/likedView.dart';
import 'package:dapur_aja/newFood.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth <= 600) {
        return HomeMobile();
      } else {
        return HomeWeb();
      }
    }));
  }
}

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  Widget build(BuildContext context) {
    String time = timeNow();

    var morning = pagi.length;
    var noon = siang.length;
    var night = malam.length;

    int timeCheck() {
      if (timeNow() == 'Malam ini  🌙') {
        return night;
      } else if (timeNow() == 'Siang ini  🌞') {
        return noon;
      } else {
        return morning;
      }
    }

    final _scrollbar = ScrollController();

    @override
    void dispose() {
      _scrollbar.dispose();
      super.dispose();
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mau makan apa",
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        'Hari ini?',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  child: CircleAvatar(
                    minRadius: 50,
                    backgroundColor: Colors.pink.shade50,
                    child: Image.asset(
                      'images/hat.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: Container(
              height: 240,
              width: 350,
              child: Card(
                color: Color.fromARGB(255, 214, 123, 154),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(
                                "Menu spesial untuk",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                time,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Scrollbar(
                          isAlwaysShown: true,
                          controller: _scrollbar,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                    bottom: Radius.circular(20))),
                            height: 170,
                            margin: EdgeInsets.only(top: 4.0),
                            padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                            child: ListView.builder(
                              controller: _scrollbar,
                              itemCount: timeCheck(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                final Food food;
                                if (timeNow() == 'Malam ini  🌙') {
                                  food = malam[index];
                                } else if (timeNow() == 'Siang ini  🌞') {
                                  food = siang[index];
                                } else {
                                  food = pagi[index];
                                }
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => FoodView(
                                                  foods: food,
                                                ))));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 200,
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.asset(
                                                food.image ?? 'images/null.jpg',
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Text(food.name)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.teal.shade100,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Pilihan ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 0,
                  color: Colors.white,
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => LikedView())));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                  color: Color.fromARGB(255, 246, 214, 212),
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('Lihat makanan yang disukai')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListFoods(),
                          ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                  color: Color.fromARGB(255, 115, 36, 218),
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.list_alt_sharp,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('Lihat menu lengkap')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddFoodView(),
                          ));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                  color: Colors.teal,
                                  height: 50,
                                  width: 50,
                                  child: Icon(
                                    Icons.plus_one,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text('Tambah menu baru')
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    String time = timeNow();

    var morning = pagi.length;
    var noon = siang.length;
    var night = malam.length;

    int timeCheck() {
      if (timeNow() == 'Malam ini  🌙') {
        return night;
      } else if (timeNow() == 'Siang ini  🌞') {
        return noon;
      } else {
        return morning;
      }
    }

    final _scrollbar = ScrollController();
    @override
    void dispose() {
      _scrollbar.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            width: 1200,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.pink.shade200,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  height: 150,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapur Aja'),
                          Text(
                            'Mau Makan Apa Hari Ini?',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        'images/hat.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.teal.shade100,
                          ),
                          margin: EdgeInsets.only(top: 16.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        'Pilihan ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                    ),
                                    const Divider(
                                      height: 20,
                                      thickness: 5,
                                      endIndent: 0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          LikedView())));
                                            },
                                            child: Container(
                                              height: 200,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                color: Colors.purple.shade50,
                                                child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    246,
                                                                    214,
                                                                    212),
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text(
                                                        'Lihat makanan yang disukai',
                                                        style: TextStyle(
                                                            fontSize: 14),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ListFoods(),
                                                  ));
                                            },
                                            child: Container(
                                              height: 200,
                                              child: Card(
                                                color: Colors.red.shade100,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                            color: Colors
                                                                .pink.shade200,
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons
                                                                  .list_alt_sharp,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text('Lihat menu lengkap',
                                                          style: TextStyle(
                                                              fontSize: 20))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddFoodView(),
                                                  ));
                                            },
                                            child: Container(
                                              height: 200,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                                color: Colors.teal.shade50,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                            color: Colors.teal,
                                                            height: 50,
                                                            width: 50,
                                                            child: Icon(
                                                              Icons.plus_one,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      255),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Text('Tambah menu baru',
                                                          style: TextStyle(
                                                              fontSize: 20))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 400,
                          margin: EdgeInsets.only(top: 12),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Color.fromARGB(255, 214, 123, 154),
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16.0,
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            "Menu spesial untuk",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            time,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                              bottom: Radius.circular(20))),
                                      height: 300,
                                      margin: EdgeInsets.only(top: 4.0),
                                      padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                                      child: Scrollbar(
                                        controller: _scrollbar,
                                        child: ListView.builder(
                                          controller: _scrollbar,
                                          itemCount: timeCheck(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: ((context, index) {
                                            final Food food;
                                            if (timeNow() == 'Malam ini  🌙') {
                                              food = malam[index];
                                            } else if (timeNow() ==
                                                'Siang ini  🌞') {
                                              food = siang[index];
                                            } else {
                                              food = pagi[index];
                                            }
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: ((context) =>
                                                            FoodView(
                                                              foods: food,
                                                            ))));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 200,
                                                      width: 300,
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          child: Image.asset(
                                                            food.image ??
                                                                'images/null.jpg',
                                                            fit: BoxFit.cover,
                                                          )),
                                                    ),
                                                    Text(food.name)
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
