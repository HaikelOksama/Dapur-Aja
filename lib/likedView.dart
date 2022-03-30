import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dapur_aja/models/foods.dart';
import 'package:dapur_aja/detail.dart';

class LikedView extends StatefulWidget {
  const LikedView({Key? key}) : super(key: key);

  @override
  State<LikedView> createState() => _LikedViewState();
}

class _LikedViewState extends State<LikedView> {
  @override
  Widget build(BuildContext context) {
    List<Food> likedFood = foodList.where((foods) => foods.favorite).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return MobileLiked();
        } else {
          return WebLiked();
        }
      },
    );
  }
}

class MobileLiked extends StatefulWidget {
  const MobileLiked({Key? key}) : super(key: key);

  @override
  State<MobileLiked> createState() => _MobileLikedState();
}

class _MobileLikedState extends State<MobileLiked> {
  @override
  Widget build(BuildContext context) {
    List<Food> likedFood = foodList.where((foods) => foods.favorite).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Favorit'),
        backgroundColor: Color.fromARGB(255, 214, 123, 154),
      ),
      body: ListView.builder(
        itemCount: likedFood.isEmpty ? 1 : likedFood.length,
        itemBuilder: ((context, index) {
          if (likedFood.isEmpty) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 400,
              child: Center(
                child: Text(
                  'Tambah makanan favorit dulu!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else {
            final Food food = likedFood[index];
            return InkWell(
              onTap: () {
                void refreshData() {
                  food.favorite = food.favorite;
                }

                FutureOr onGoBack(dynamic value) {
                  refreshData();
                  setState(() {});
                }

                Route route = MaterialPageRoute(
                    builder: ((context) => FoodView(foods: food)));
                Navigator.push(context, route).then(onGoBack);
              },
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Stack(children: [
                      Image.asset(food.image ?? 'images/null.jpg'),
                      food.favorite
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Text("")
                    ])),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Klik untuk lihat Detail dan Deskripsi!')
                              ],
                            )))
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

class WebLiked extends StatefulWidget {
  const WebLiked({Key? key}) : super(key: key);

  @override
  State<WebLiked> createState() => _WebLikedState();
}

class _WebLikedState extends State<WebLiked> {
  @override
  Widget build(BuildContext context) {
    List<Food> likedFood = foodList.where((foods) => foods.favorite).toList();
    return Scaffold(
      appBar: AppBar(title: Text('Menu Favorit')),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          width: 1200,
          child: ListView.builder(
            itemCount: likedFood.isEmpty ? 1 : likedFood.length,
            itemBuilder: ((context, index) {
              if (likedFood.isEmpty) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 400,
                  child: Center(
                    child: Text(
                      'Tambah makanan favorit dulu!',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              } else {
                final Food food = likedFood[index];
                return InkWell(
                  onTap: () {
                    void refreshData() {
                      food.favorite = food.favorite;
                    }

                    FutureOr onGoBack(dynamic value) {
                      refreshData();
                      setState(() {});
                    }

                    Route route = MaterialPageRoute(
                        builder: ((context) => FoodView(foods: food)));
                    Navigator.push(context, route).then(onGoBack);
                  },
                  child: Container(
                    height: 300,
                    width: 600,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Stack(children: [
                            Container(
                              width: 400,
                              height: 300,
                              child: Image.asset(
                                food.image ?? 'images/null.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            food.favorite
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  )
                                : Text("")
                          ])),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    food.name,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Klik untuk lihat Detail dan Deskripsi!')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
