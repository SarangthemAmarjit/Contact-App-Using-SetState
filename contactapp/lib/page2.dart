import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class Page2 extends StatefulWidget {
  final String name;
  final String number;
  final String address11;
  final String address;
  final String email;
  final String work;
  final String other;
  const Page2(
      {Key? key,
      required this.name,
      required this.number,
      required this.address11,
      required this.address,
      required this.email,
      required this.work,
      required this.other})
      : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Information"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("NAME : ", style: TextStyle(fontSize: 20)),
                Text(widget.name,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "CONTACT NUMBER :",
                  style: TextStyle(fontSize: 20),
                ),
                Text(widget.number,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ADDRESS 1 :", style: TextStyle(fontSize: 20)),
                Text(widget.address11,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ADDRESS 2 :", style: TextStyle(fontSize: 20)),
                Text(widget.address,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("WORK :", style: TextStyle(fontSize: 20)),
                Text(widget.work,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("EMAIL :", style: TextStyle(fontSize: 20)),
                Text(widget.email,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("OTHER :", style: TextStyle(fontSize: 20)),
                Text(widget.other,
                    style: TextStyle(
                        fontSize: 20, color: Colors.greenAccent[400])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
