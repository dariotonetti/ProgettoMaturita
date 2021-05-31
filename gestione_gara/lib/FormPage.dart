import 'package:flutter/material.dart';
import 'package:gestione_gara/Menu.dart';
import 'InputDeco_design.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String name, email;

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.yellow[700],
        title: new Text("Iscrizione"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Nome"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Perfavore inserisci un nome';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Cognome"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Perfavore inserisci un cognome';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.code, "Codice Fiscale"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Perfavore inserisci un CF';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Nome Gara"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Perfavore inserisci una gara';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.category, "Categoria Gara"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Perfavore inserisci una categoria';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      name = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.yellow[400],
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        print("Fatto");
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Scaffold(body: Menu());
                        }));
                      } else {
                        print("Errore");
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    textColor: Colors.black54,
                    child: Text("Iscriviti", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(body: Menu());
          }));
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.yellow[300],
      ),
    );
  }
}
