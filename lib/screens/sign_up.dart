
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/api.dart';
import 'package:untitled4/widgets/reuseable_widgets.dart';

import '../provider/home_screen.dart';

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
    var _api = Provider.of<testingProvider>(context);

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
                      Container(
                        height: 25,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.green),
                      ),
                      const Text("Welcome",
                        style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.green),),
                      const Text("Create an account",
                        style: TextStyle(color: Colors.blue),),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                          key:_formKey ,
                          child: Column(
                            children: [
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller:_firstNameController ,
                                  decoration: ThemeHelper().textInputDecoration('first Name', 'Enter your first name'),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller:_lastNameController ,
                                  decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller:_emailTextController ,
                                  decoration: ThemeHelper().textInputDecoration('Email', 'Enter your Email address'),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child: TextFormField(
                                  controller:_phoneNumberController ,
                                  decoration: ThemeHelper().textInputDecoration('PhoneNumber', 'Enter your PhoneNumber'),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                                child:TextField(
                                  controller: _passwordTextController,
                                  obscureText:true,
                                  decoration: ThemeHelper().textInputDecoration('Password','Enter Your Password'),
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              signInsignUpButton(context, false, ()async{
                                await _api.signUp(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _phoneNumberController.text.toString(),
                                    _emailTextController.text,
                                    _passwordTextController.text).then(
                                        (value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
                              );})
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
