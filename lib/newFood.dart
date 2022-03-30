import 'package:flutter/material.dart';
import 'package:dapur_aja/models/foods.dart';

class AddFoodView extends StatefulWidget {
  const AddFoodView({Key? key}) : super(key: key);

  @override
  State<AddFoodView> createState() => _AddFoodViewState();
}

class _AddFoodViewState extends State<AddFoodView> {
  final nameControl = TextEditingController();
  final descControl = TextEditingController();
  final recipeControl = TextEditingController();

  var desField = 1;
  var field = 1;

  @override
  void dispose() {
    nameControl.dispose();
    descControl.dispose();
    recipeControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _formKey2 = GlobalKey<FormState>();
    final _formKey3 = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Resep baru'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return MobileNewFood();
            } else {
              return WebNewFood();
            }
          },
        ));
  }
}

class MobileNewFood extends StatefulWidget {
  const MobileNewFood({Key? key}) : super(key: key);

  @override
  State<MobileNewFood> createState() => _MobileNewFoodState();
}

class _MobileNewFoodState extends State<MobileNewFood> {
  var nameControl = TextEditingController();
  var descControl = TextEditingController();
  var recipeControl = TextEditingController();

  // final nameControl = TextEditingController();
  // final descControl = TextEditingController();
  // final recipeControl = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var desField = 5;
    var field = 5;

    @override
    void dispose() {
      nameControl.dispose();
      descControl.dispose();
      recipeControl.dispose();
      super.dispose();
    }

    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              onTap: (() {
                if (recipeControl.text.isEmpty) {
                  setState(() {
                    field = 1;
                  });
                }
                setState(() {
                  desField = 1;
                  field = 1;
                });
              }),
              maxLines: 1,
              decoration: InputDecoration(
                  label: Text('Masukkan nama Makanan'),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder()),
              controller: nameControl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan Text";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              onTap: (() {
                if (recipeControl.text.isEmpty) {
                  setState(() {
                    field = 1;
                  });
                }
                setState(() {
                  desField = 5;
                  field = 1;
                });
              }),
              maxLines: desField,
              decoration: InputDecoration(
                  isDense: true,
                  label: Text('Masukkan Deskripsi'),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder()),
              controller: descControl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan Text";
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              onTap: (() {
                if (recipeControl.text.isEmpty) {
                  setState(() {
                    field = 1;
                  });
                }
                setState(() {
                  field = 5;
                  desField = 1;
                });
              }),
              maxLines: field,
              decoration: InputDecoration(
                label: Text('Masukkan Resep'),
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(), isDense: true, // Added this
              ),
              controller: recipeControl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Masukkan Text";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 800,
              child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  Text('Resep makanan berhasil ditambahkan!'),
                            );
                          });
                      create(nameControl.text, descControl.text,
                          recipeControl.text, false);
                    }
                  },
                  child: Text('tambahkan menu')),
            )
          ],
        ),
      ),
    ));
  }
}

class WebNewFood extends StatefulWidget {
  const WebNewFood({Key? key}) : super(key: key);

  @override
  State<WebNewFood> createState() => _WebNewFoodState();
}

class _WebNewFoodState extends State<WebNewFood> {
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final descControl = TextEditingController();
  final recipeControl = TextEditingController();

  var desField = 1;
  var field = 1;

  @override
  void dispose() {
    nameControl.dispose();
    descControl.dispose();
    recipeControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 1200,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  autofocus: true,
                  onTap: (() {
                    if (recipeControl.text.isEmpty) {
                      setState(() {
                        field = 1;
                      });
                    }
                    setState(() {
                      desField = 1;
                      field = 1;
                    });
                  }),
                  maxLines: 1,
                  decoration: InputDecoration(
                      label: Text('Masukkan nama Makanan'),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  controller: nameControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Text";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey2,
                child: TextFormField(
                  autofocus: true,
                  onTap: (() {
                    if (recipeControl.text.isEmpty) {
                      setState(() {
                        field = 1;
                      });
                    }
                    setState(() {
                      desField = 5;
                      field = 1;
                    });
                  }),
                  maxLines: desField,
                  decoration: InputDecoration(
                      isDense: true,
                      label: Text('Masukkan Deskripsi'),
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder()),
                  controller: descControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Text";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey3,
                child: TextFormField(
                  onTap: (() {
                    if (recipeControl.text.isEmpty) {
                      setState(() {
                        field = 1;
                      });
                    }
                    setState(() {
                      field = 5;
                      desField = 1;
                    });
                  }),
                  maxLines: field,
                  decoration: InputDecoration(
                    label: Text('Masukkan Resep'),
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(), isDense: true, // Added this
                  ),
                  controller: recipeControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Masukkan Text";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 800,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _formKey2.currentState!.validate() &&
                          _formKey3.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    Text('Resep makanan berhasil ditambahkan!'),
                              );
                            });
                        create(nameControl.text, descControl.text,
                            recipeControl.text, false);
                      }
                    },
                    child: Text('tambahkan menu')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void create(name, desc, recipe, favorite) {
  var newFood = <Food>[
    Food(name: name, desc: desc, recipe: recipe, favorite: favorite)
  ];
  foodList.addAll(newFood);
}
