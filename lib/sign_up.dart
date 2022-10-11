
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/api.dart';
import 'package:untitled4/widgets/reuseable_widgets.dart';

import 'home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() =>_SignUpState();
}

class _SignUpState extends State<SignUp> {
  Key _formKey= GlobalKey<FormState>();
  TextEditingController _passwordTextController= TextEditingController();
  TextEditingController _emailTextController= TextEditingController();
  TextEditingController _firstNameController= TextEditingController();
  TextEditingController _lastNameController= TextEditingController();
  TextEditingController _phoneNumberController= TextEditingController();
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
                                child: TextFormField(
                                  controller:_firstNameController ,
                                  decoration: ThemeHelper().textInputDecoration('first Name', 'Enter your first name'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: TextFormField(
                                  controller:_lastNameController ,
                                  decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: TextFormField(
                                  controller:_emailTextController ,
                                  decoration: ThemeHelper().textInputDecoration('Email', 'Enter your Email address'),
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: TextFormField(
                                  controller:_phoneNumberController ,
                                  decoration: ThemeHelper().textInputDecoration('PhoneNumber', 'Enter your PhoneNumber'),
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
                              signInsignUpButton(context, false, (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                signUp(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _phoneNumberController.text.toString(),
                                    _emailTextController.text,
                                    _passwordTextController.text);
                                setState(() {

                                });
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
