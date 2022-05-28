import 'package:flutter/material.dart';
import 'page2.dart';

class Page1 extends StatefulWidget {
  final String contactname;
  final String contactnumber;
  const Page1(
      {Key? key, required this.contactname, required this.contactnumber})
      : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String name12 = '';
  String number12 = '';
  String address1 = '';
  String address2 = '';
  String email1 = '';
  String work1 = '';
  String other1 = '';

  TextEditingController _add1controller = TextEditingController();
  TextEditingController _add2controller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _workcontroller = TextEditingController();
  TextEditingController _othercontroller = TextEditingController();

  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 5,
            collapsedHeight: 65,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      Text(
                        widget.contactname,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone_enabled,
                        color: Colors.greenAccent[400],
                      ),
                      Text(
                        widget.contactnumber,
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              background: FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "ADD MORE DETAIL IN BELOW :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent[400]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: TextFormField(
                        controller: _add1controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'ADDRESS 1:',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: TextFormField(
                        controller: _add2controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'ADDRESS 2:',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: TextFormField(
                        controller: _workcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'WORK :',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: TextFormField(
                        controller: _emailcontroller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'EMAIL :',
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, bottom: 20, right: 20),
                        child: TextFormField(
                          controller: _othercontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: 'OTHER :',
                          ),
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          name12 = widget.contactname;
                          number12 = widget.contactnumber;
                          address1 = _add1controller.text;
                          address2 = _add2controller.text;
                          work1 = _workcontroller.text;
                          email1 = _emailcontroller.text;
                          other1 = _othercontroller.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Page2(
                                      name: name12,
                                      number: number12,
                                      address11: address1,
                                      address: address2,
                                      email: email1,
                                      work: work1,
                                      other: other1))));
                        },
                        child: Text("SAVE")),
                  ],
                )),
          ),

          // Place sliver widgets here
        ],
      ),
    );
  }
}
