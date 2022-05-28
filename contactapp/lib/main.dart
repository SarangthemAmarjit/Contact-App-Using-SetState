import 'package:flutter/material.dart';

import 'page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CONTACT APP 1.2',
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Contactapp(),
    );
  }
}

class Contactapp extends StatefulWidget {
  const Contactapp({Key? key}) : super(key: key);

  @override
  State<Contactapp> createState() => _ContactappState();
}

class _ContactappState extends State<Contactapp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String name1 = '';
  String number1 = '';

  TextEditingController _namefieldcontroller = TextEditingController();
  TextEditingController _phonfieldcontroller = TextEditingController();

  List<String> str = [];
  List<dynamic> str2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact App 1.1")),
      body: Column(
        children: [
          Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: str.length,
                  itemBuilder: (cnt, ind) {
                    return ListTile(
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(str2[ind]),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              final String _name = str[ind];
                              final String _phone = str2[ind];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Page1(
                                          contactname: _name,
                                          contactnumber: _phone))));
                            },
                            child: Text(str[ind]),
                          ),
                          PopupMenuButton(
                            onSelected: (item) {
                              setState(() {
                                str2.removeAt(ind);
                                str.removeAt(ind);
                              });
                            },
                            itemBuilder: (cnt) {
                              return [
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text('Delete'),
                                ),
                              ];
                            },
                          ),
                          Icon(
                            Icons.phone,
                            color: Colors.greenAccent[700],
                          ),
                        ],
                      ),
                      leading: Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 42,
                            color: Colors.blue[600],
                          ),
                          Icon(Icons.person, color: Colors.yellow)
                        ],
                        alignment: Alignment.center,
                      ),
                    );
                  })
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (cnt) {
              return AlertDialog(
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CANCEL")),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                name1 = _namefieldcontroller.text;
                                number1 = _phonfieldcontroller.text;
                                setState(() {
                                  str.add(name1);
                                  str2.add(number1);
                                });

                                Navigator.pop(context);
                              },
                              child: Text("ADD")),
                        )
                      ],
                    ),
                  ],
                  title: Text("Add new contact"),
                  content: Form(
                    key: _formkey,
                    child: Container(
                      height: 150,
                      child: Column(
                        children: [
                          TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _namefieldcontroller,
                              decoration: InputDecoration(
                                hintText: 'Name',
                              )),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _phonfieldcontroller,
                            decoration:
                                InputDecoration(hintText: 'Phone Number'),
                          )
                        ],
                      ),
                    ),
                  ));
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
