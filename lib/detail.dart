import 'package:dapur_aja/home.dart';
import 'package:flutter/material.dart';
import 'package:dapur_aja/models/foods.dart';
import 'package:dapur_aja/listFood.dart';

class FoodView extends StatefulWidget {
  final Food foods;
  const FoodView({Key? key, required this.foods}) : super(key: key);

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth <= 600) {
        return MobileView(foods: widget.foods);
      } else {
        return WebView(foods: widget.foods);
      }
    }));
  }
}

class MobileView extends StatefulWidget {
  final Food foods;
  const MobileView({Key? key, required this.foods}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 115, 36, 218),
          onPressed: (() {
            setState(() {
              final snackBar = SnackBar(
                content: Text(widget.foods.favorite
                    ? "Dihapus dari favorit"
                    : "Difavoritkan!"),
                duration: Duration(milliseconds: 500),
              );
              widget.foods.favorite = !widget.foods.favorite;
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
          }),
          child: Icon(
            widget.foods.favorite ? Icons.favorite : Icons.favorite_border,
            color: widget.foods.favorite ? Colors.red : Colors.white,
          )),
      appBar: AppBar(
        title: Text('Dapur Aja'),
        backgroundColor: Color.fromARGB(255, 214, 123, 154),
        leading: Image.asset('images/hat.png'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 800,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: 250,
                      width: 800,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        child: Image.asset(
                          widget.foods.image ?? 'images/null.jpg',
                          color: Colors.black26,
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70,
                              child: CircleAvatar(
                                backgroundColor: Colors.black45,
                                child: IconButton(
                                    mouseCursor: SystemMouseCursors.click,
                                    tooltip: 'Kembali',
                                    splashColor: Colors.white,
                                    highlightColor: Colors.white,
                                    hoverColor: Colors.black,
                                    onPressed: () {
                                      Navigator.pop(
                                          context, widget.foods.favorite);
                                    },
                                    icon: Icon(
                                      Icons.navigate_before,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Text(
                              widget.foods.name,
                              style:
                                  TextStyle(fontSize: 32, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deskripsi",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.foods.desc),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Resep",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.foods.recipe)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  final Food foods;
  const WebView({Key? key, required this.foods}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.pink.shade50,
              width: 800,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(60)),
                    child: Card(
                      child: Container(
                        width: 800,
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(20)),
                                child: Image.asset(
                                  widget.foods.image ?? 'images/null.jpg',
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    widget.foods.name,
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 223, 197, 206),
                                    child: IconButton(
                                        tooltip: 'Tambahkan ke favorit',
                                        onPressed: () {
                                          setState(() {
                                            widget.foods.favorite =
                                                !widget.foods.favorite;
                                          });
                                        },
                                        icon: Icon(
                                          widget.foods.favorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                    width: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.foods.desc),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 12, right: 12),
                    width: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Resep',
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(widget.foods.recipe),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, widget.foods.favorite);
                          },
                          child: Text('Kembali')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
