
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/home_screen.dart';
import 'package:untitled4/screens/sign_up.dart';
import 'package:untitled4/widgets/reuseable_widgets.dart';

import '../provider/api.dart';

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
    var _api = Provider.of<testingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 85,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) )),
            ),
            Container(
              //header
            ),
            SafeArea(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    children: [
                      const Text("Welcome",
                        style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.green),),
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
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text("Don't have An account? ",style:  TextStyle(color: Colors.red),),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                    },
                                    child:const Text("Sign Up", style: TextStyle(color: Colors.blue),
                                  )
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),

                              signInsignUpButton(context, true, ()async{
                                await _api.login(_emailTextController.text.toString(),_passwordTextController.text.toString(),context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
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
