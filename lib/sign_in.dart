
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/home_screen.dart';
import 'package:untitled4/widgets/reuseable_widgets.dart';

import 'api.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Key _formKey= GlobalKey<FormState>();
  TextEditingController _passwordTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //header
            ),
            SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      Text("Welcome",
                        style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                      Text("Sign In to your account",
                        style: TextStyle(color: Colors.blue),),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                          key:_formKey ,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller:_emailTextController ,
                                  decoration: ThemeHelper().textInputDecoration('E-mail', 'Enter your Email address'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child:TextField(
                                  controller: _passwordTextController,
                                  obscureText:true,
                                  decoration: ThemeHelper().textInputDecoration('Password','Enter Your Password'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),

                              signInsignUpButton(context, true, (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                login(_emailTextController.text.toString(),_passwordTextController.text.toString());

                              })
                            ],
                          )
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
