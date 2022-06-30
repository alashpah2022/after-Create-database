import 'package:firebase/Datebase/databse.dart';
import 'package:firebase/Section/SectionScreen.dart';
import 'package:firebase/shared_color/gradient_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../SignUpScreen/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email="";
  String password="";
  String? errorMessage;
  final _auth= FirebaseAuth.instance;

  @override
  void initState()
  {
    super.initState();

    CreateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: gradientColor(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:_formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Image.asset('asset/images/logo.png')),
                    ),
                    const SizedBox(height: 25),

                     Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        controller:emailController ,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,
                        onSaved: (value){
                          emailController.text=value!;
                        },
                        textInputAction: TextInputAction.next,
                        onChanged: (emailValue){
                          email=emailValue;},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return("Please Enter a valid Email");
                          }return null;
                        },
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding:  EdgeInsetsDirectional.only(end: 20),
                            child: CircleAvatar(
                                child: Icon(Icons.email,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                                radius: 30),
                          ),

                          labelText: "     EMAIL",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide:  BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),


                      ),),

                    const SizedBox(height: 25),
                     Container(
                      width: 300,
                      height: 60,
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        autofocus: false,
                        onSaved: (value)
                        {
                          passwordController.text=value!;
                        },
                        textInputAction: TextInputAction.done,

                        onChanged: (passwordValue){
                          password=passwordValue;},
                        validator: (value) {
                          RegExp regex =  RegExp(r'^.{6,}$');
                          if (value!.isEmpty) {
                            return 'password is required for login';
                          }
                          if(!regex.hasMatch(value)){

                            return "Please enter valid password(Min. 6 character) ";
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding:  EdgeInsetsDirectional.only(end: 20),
                            child: CircleAvatar(
                                child: Icon(Icons.lock,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                backgroundColor: Color.fromRGBO(50, 165, 248, 1),
                                radius: 30),
                          ),
                          labelText: "  PASSOWRD ",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide:  BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),


                      ),
                    ),
                    const SizedBox(height: 25),


                    ElevatedButton(
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(

                          //onSurface: surfaceColor,
                          fixedSize: const Size(300, 60),
                          primary: Colors.blue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          signIn(emailController.text, passwordController.text);
                        }),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        'Sign Up?',
                        style: TextStyle(
                          inherit: true,
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SectionScreen())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
}