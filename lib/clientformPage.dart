import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: clientformPage(),
  ));
}

class clientformPage extends StatefulWidget {
  @override
  _clientState createState() => _clientState();
}

class _clientState extends State<clientformPage> {

  TextEditingController nameClientController = TextEditingController();
  TextEditingController localClientController = TextEditingController();
  TextEditingController telephoneClientController = TextEditingController();
  TextEditingController emailClientController = TextEditingController();

  GlobalKey<FormState> _formClientKey = GlobalKey<FormState>();

  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NOVO CLIENTE"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(//só para testar as rota navigator
              icon: Icon(Icons.add_circle),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (){
                _refreshdata();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                  key: _formClientKey,
                  child:(Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                          Icons.person_add,
                          size:90,
                          color: Colors.deepOrange
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameClientController,
                        decoration: InputDecoration(
                          labelText: "Nome:",
                          labelStyle: TextStyle(color: Colors.indigoAccent),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        validator: (value){
                          if(value.isEmpty){
                            return "informe o Nome!";
                          }
                        },
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: localClientController,
                          decoration: InputDecoration(
                            labelText: "Local:",
                            labelStyle: TextStyle(color: Colors.indigoAccent),
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54,fontSize: 18),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Informe o Local!";
                            }
                          }
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: telephoneClientController,
                        decoration: InputDecoration(
                          labelText: "Telefone/Celular:",
                          labelStyle: TextStyle(color: Colors.indigoAccent),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        validator: (value){
                          if(value.isEmpty){
                            return "informe a Numero!";
                          }
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailClientController,
                        decoration: InputDecoration(
                          labelText: "E-mail:",
                          labelStyle: TextStyle(color: Colors.indigoAccent),
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        validator: (value){
                          if(value.isEmpty){
                            return "informe o E-mail!";
                          }
                        },
                      ),

                      Padding(
                          padding: EdgeInsets.only(bottom: 20, top:20),
                          child: Container(
                            child: RaisedButton(
                                onPressed: (){
                                  if(_formClientKey.currentState.validate()) {
                                    _saveProductfunc();
                                  }
                                  nameClientController.clear();
                                  localClientController.clear();
                                  telephoneClientController.clear();
                                  emailClientController.clear();
                                },
                                color: Colors.lightGreen,
                                child: Text(
                                  "SALVAR",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                )
                            ),
                          )
                      ),
                      Text(
                        _result,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.lightGreen, fontSize: 18),
                      )
                    ],
                  ))
              ),
            )
        )
    );




  }

  void _refreshdata(){
    setState(() {
      nameClientController.clear();
      localClientController.clear();
      telephoneClientController.clear();
      emailClientController.clear();
      _result = "";
    });


  }
  void _saveProductfunc(){
    String nameClient = nameClientController.text;
    //double amountProd = double.parse(amountProductController.text);
    String localClient = localClientController.text;
    String telephoneClient = telephoneClientController.text;
    String emailClient = emailClientController.text;

    setState(() {

      _result = "Dados salvos! Nome: ${nameClient}, Local:${localClient}, Telefone/Celular:${telephoneClient}, E-mail:${emailClient}.";
      nameClientController.clear();
      localClientController.clear();
      telephoneClientController.clear();
      emailClientController.clear();
    });
  }
}


