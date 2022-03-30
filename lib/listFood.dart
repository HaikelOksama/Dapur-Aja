import 'dart:async';

import 'package:dapur_aja/detail.dart';
import 'package:flutter/material.dart';
import 'package:dapur_aja/models/foods.dart';

class ListFoods extends StatefulWidget {
  const ListFoods({Key? key}) : super(key: key);

  @override
  State<ListFoods> createState() => _ListFoodsState();
}

class _ListFoodsState extends State<ListFoods> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Menu Makanan'),
            backgroundColor: Color.fromARGB(255, 214, 123, 154)),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return GridFood(gridCount: 2);
            } else if (constraints.maxWidth <= 800) {
              return WebGrid(gridCount: 3);
            } else {
              return WebGrid(gridCount: 4);
            }
          },
        ));
  }
}

class ListFood extends StatefulWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  State<ListFood> createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: ((context, index) {
        final Food food = foodList[index];
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
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
      }),
    );
  }
}

class GridFood extends StatefulWidget {
  final int gridCount;
  const GridFood({Key? key, required this.gridCount}) : super(key: key);

  @override
  State<GridFood> createState() => _GridFoodState();
}

class _GridFoodState extends State<GridFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: widget.gridCount,
        children: foodList.map((food) {
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
              child: Column(
                children: [
                  Expanded(
                    child: Stack(children: [
                      Container(
                          width: 400,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                            child: Image.asset(
                              food.image ?? 'images/null.jpg',
                              fit: BoxFit.cover,
                            ),
                          )),
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
                    ]),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Klik untuk lihat Detail dan Deskripsi!')
                        ],
                      ))
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class WebGrid extends StatefulWidget {
  final int gridCount;
  const WebGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  State<WebGrid> createState() => _WebGridState();
}

class _WebGridState extends State<WebGrid> {
  final _scrollBar = ScrollController();
  @override
  void dispose() {
    _scrollBar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 1200,
        child: GridView.count(
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          crossAxisCount: widget.gridCount,
          children: foodList.map((food) {
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
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(children: [
                          Expanded(
                            child: Container(
                                width: 400,
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(20)),
                                  child: Image.asset(
                                    food.image ?? 'images/null.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                )),
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
                              : Text('')
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Klik untuk lihat Detail dan Deskripsi!')
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
