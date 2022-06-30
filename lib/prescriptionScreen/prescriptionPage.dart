import 'package:flutter/material.dart';

class DialogExample extends StatefulWidget {
  @override
  _DialogExampleState createState() =>  _DialogExampleState();
}

class _DialogExampleState extends State<DialogExample> {
  String _text = "initial";
  late TextEditingController _c;

  @override
  initState() {
    _c =  TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff042246),
                Color(0xff041e3e),
                Color(0xff1a5aa0),
                Color(0xff01060c),
                Color(0xff01070e)
              ],
              stops: [0.0, 0.0, 0.01, 0.760, 9.80],
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child:  Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
               const SizedBox(height: 15),
                const Center(
                  child: Text(
                    "Prescription",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  height: 350,
                  child:  Text(
                    _text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        overflow: TextOverflow.clip),
                    maxLines: 30,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                builder: (context) =>  Dialog(
                      child: Container(
                        height: 200,
                        child:  Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 150,
                              padding: const EdgeInsets.all(20),
                              child:  TextField(
                                style: const TextStyle(fontSize: 20),
                                decoration: const InputDecoration(
                                    hintText: "Update Info"),
                                controller: _c,
                                maxLines: 5,
                                autocorrect: true,
                              ),
                            ),
                             TextButton(
                              child: const Text("Save"),
                              onPressed: () {
                                setState(() {
                                  _text = _c.text;
                                });
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                context: context);
          },
          child: const Icon(Icons.edit),
        ));
  }
}
