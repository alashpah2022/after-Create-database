import 'package:firebase/shared_color/gradient_color.dart';
import 'package:flutter/material.dart';

import '../Section/SectionScreen.dart';

class confirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: gradientColor(),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const Center(
                    child: Text(
                      "CONFIRMATION",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Image.asset('asset/icons/confirmIcon.png'),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      //  padding: const EdgeInsetsDirectional.only(end: 20),

                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white12,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: TextField(
                          cursorColor: Colors.white,
                          style:  TextStyle(
                            //height: .05,
                            color: Colors.white,
                          ),
                          decoration:  InputDecoration(
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            labelText: "Add Confirm Password ",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  ElevatedButton(
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        //onSurface: surfaceColor,
                        minimumSize: const Size(double.infinity, 50),
                        primary: Colors.blue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SectionScreen(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
