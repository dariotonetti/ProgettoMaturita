import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gestione_gara/FormPage.dart';
import 'package:gestione_gara/dbmanager.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final DbStudentManager dbmanager = new DbStudentManager();

  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();
  final _orarioController = TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  Gara classe;
  List<Gara> studlist;
  int updateIndex;

  /*addAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Non puoi modificare questa gara!",
                style: TextStyle(color: Colors.green, fontSize: 20)),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Sono un amministratore",
                    style: TextStyle(color: Colors.green[200], fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(body: Menu());
                  }));
                },
              ),
            ],
          );
        });
  }*/

  removeAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Non sei più iscritto a questa gara!",
                style: TextStyle(color: Colors.red, fontSize: 20)),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("OK",
                    style: TextStyle(color: Colors.red[200], fontSize: 20)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(body: Menu());
                  }));
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
          title: new Text("Gare Motocross"),
          elevation:
              defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Text("Menu", style: TextStyle(fontSize: 25, color: Colors.yellow[800]), textAlign: TextAlign.center,),
              //new Title(child: Text("Menu", style: TextStyle(fontSize: 25, color: Colors.red[200])), color: Colors.red),
              /*new UserAccountsDrawerHeader(
              accountName: new Text("Dario Tonetti", style: TextStyle(fontSize: 25)),
              accountEmail: new Text("tonetti.d@gmail.com"),
            ),*/
              new Divider(),
              new ListTile(
                title: new Text("Home"),
                trailing: new Icon(Icons.home, color: Colors.red),
                onTap: () => Navigator.of(context).pop(),
              ),
              new ListTile(
                title: new Text("Aggiungi Gara | Modifica Gara"),
                trailing: new Icon(Icons.add_circle, color: Colors.green),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(body: addGara(context));
                })),
              ),
              /*new Divider(),
              new ListTile(
                title: new Text("Iscrizione"),
                trailing: new Icon(Icons.person, color: Colors.black),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(body: FormPage());
                })),
              ),
              new ListTile(
                title: new Text("Settings"),
                trailing: new Icon(Icons.settings, color: Colors.orange),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Scaffold(body: SettingPage());
                })),
              ),*/
            ],
          ),
        ),
        body: body(context));
  }

  Widget addGara(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow[700],
        title: new Text("Aggiungi | Modifica Gara"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      body: ListView(children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Nome'),
                  controller: _nameController,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Nome non può essere vuoto',
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Categoria'),
                  controller: _categoryController,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Categoria non può essere vuota',
                ),

                TextFormField(
                  decoration: new InputDecoration(labelText: 'Data'),
                  controller: _dateController,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Data non può essere vuota',
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Orario'),
                  controller: _orarioController,
                  validator: (val) =>
                      val.isNotEmpty ? null : 'Orario non può essere vuoto',
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  textColor: Colors.black54,
                  color: Colors.yellow[400],
                  child: Container(
                      width: 200,
                      child: Text(
                        'Crea',
                        textAlign: TextAlign.center,
                      )),
                  onPressed: () {
                    _submitStudent(context);
                  },
                ),
              ])),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(body: Menu());
          }));
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.yellow[300],
      ),
    );
  }

  Widget body(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: dbmanager.getGaraList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        studlist = snapshot.data;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: studlist == null ? 0 : studlist.length,
                          itemBuilder: (BuildContext context, int index) {
                           Gara st = studlist[index];
                            return Card(
                              elevation: 5,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 130,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Nome: ${st.name}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'Categoria: ${st.category}',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          'Data: ${st.date}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          'Orario: ${st.orario}',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {
                                      removeAlertDialog(context);
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle,
                                      color: Colors.green[500],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return Scaffold(
                                            body: FormPage());
                                      }));
                                    },
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return Scaffold(
                                            body: addGara(context));
                                      }));
                                      _nameController.text = st.name;
                                      _categoryController.text = st.category;
                                      _dateController.text = st.date;
                                      _orarioController.text = st.orario;
                                      classe = st;
                                      updateIndex = index;
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      dbmanager.deleteGara(st.id);
                                      setState(() {
                                        print('Gara Cancellata dal Db');
                                        studlist.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_forever,
                                      color: Colors.red[300],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return new CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (classe == null) {
        Gara st = new Gara(
            name: _nameController.text, category: _categoryController.text, date: _dateController.text, orario: _orarioController.text);
        dbmanager.insertGara(st).then((id) => {
              _nameController.clear(),
              _categoryController.clear(),
              _dateController.clear(),
              _orarioController.clear(),
              print('Gara Aggiunta al Db con id: ${id}'),
            });
      } else {
        classe.name = _nameController.text;
        classe.category = _categoryController.text;
        classe.date = _dateController.text;
        classe.orario = _orarioController.text;

        dbmanager.updateGara(classe).then((id) => {
              setState(() {
                studlist[updateIndex].name = _nameController.text;
                studlist[updateIndex].category = _categoryController.text;
                studlist[updateIndex].name = _dateController.text;
                studlist[updateIndex].category = _orarioController.text;
              }),
              _nameController.clear(),
              _categoryController.clear(),
              _dateController.clear(),
              _orarioController.clear(),
              classe = null
            });
      }
    }
  }
}
