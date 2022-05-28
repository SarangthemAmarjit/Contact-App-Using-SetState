import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'newpage.dart';
import 'Contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CONTACT APP',
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
      appBar: AppBar(title: Text("Contact App")),
      body: Column(
        children: [
          Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: str.length,
                  itemBuilder: (cnt, ind) {
                    return ListTile(
                      subtitle: Text(str2[ind]),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(str[ind]),
                          PopupMenuButton(
                            icon: Icon(Icons.more_rounded),
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
                            onPressed: () {},
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
