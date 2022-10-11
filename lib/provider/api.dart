import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class testingProvider extends ChangeNotifier{
  List allServices=[];
  Future signUp (firstName,lastName,phoneNumber,email,password)async{
    try{
      http.Response response=await http.post(Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/signup"),
          body: {"firstName":firstName,
            "lastName": lastName,
            "phoneNumber": phoneNumber,
            "email": email,
            "password":password,
          });
      print("status code: ${response.statusCode}");
      if (response.statusCode == 200) {
        //print(await response.stream.bytesToString());
        print("Account Successfully Created");
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
      }
      else {
        print(response.reasonPhrase);
        print("Failed");
      }
    }catch(e){
      print(e.toString());
    }
  }


  Future login (String email, password,context)async{
    var storage= await SharedPreferences.getInstance();
    try{
      http.Response response= await http.post(Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/login"),
          body: {
            'email': email ,
            'password': password,
          });
      print(response.body);
      if(response.statusCode==200){
        var data=jsonDecode(response.body);
        var _token = data['access_token'];
        storage.setString('token', _token );
        var newToken = storage.getString('token');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        print(newToken);
        print("account Logged-In successfully");
        notifyListeners();
      }else{
        print("failed");
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future bookTicket (String seats,String from, String destination,String reservation, String time)async {
    try {
      var storage= await SharedPreferences.getInstance();
      var token = await storage.getString('token');
      http.Response response = await http.post(
          Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/reservation"),
          headers: {
            'Authorization': 'Bearer $token'
          },
          body: {
            "trainSeats": seats,
            "coach": reservation,
            "bookingPeriod": time,
            "from": from,
            "to": destination
          });
      print(token);
      print(response.body);
      if (response.statusCode == 200) {
        print(await response.toString());
        print("Ticket booked successfully");
        notifyListeners();
      }
      if (response.statusCode == 401) {
        print("Un-authorized");
      }
      else {
        print('Response status: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future  get() async {
    var storage= await SharedPreferences.getInstance();
    var token = await storage.getString('token');
    try{
      http.Response response = await http.get(
          Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/ourservices"),
          headers: {
            'Authorization': 'Bearer $token'
          });
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200){
        var responsedata = jsonDecode(response.body);
        allServices.clear();
        allServices= responsedata['data'];
        var seat1= allServices[0]["train_destination_from_to"];
        print(responsedata.data!);
        notifyListeners();
      }

    } catch(e){
      throw e;
    }
  }
  Future delete()async{
    var storage= await SharedPreferences.getInstance();
    var token = await storage.getString('token');
    try{
      http.Response response = await http.delete(
          Uri.parse("https://move-me-app.herokuapp.com/api/v1/deletebooking?id=630f4362330089b6b46fbc24"),
          headers: {
            'Authorization': 'Bearer $token'
          });
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200){
        get();
        notifyListeners();
      }

    } catch(e){
      throw e;

    }
  }
}

//   var request = http.Request('POST', Uri.parse('localhost:5000/api/v1/booking'));
//   request.body = '''{\r\n"fullName": "ibrahim ilori",\r\n"address": "abeokuta nigeria",\r\n"destination": "abuja",\r\n"reservation": "firstclass",\r\n"time": "morning",\r\n"date": "2022-02-25"\r\n}''';
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   }
//   else {
//   print(response.reasonPhrase);
//   }
// }
//

// Future putIn()async{
//   var request = http.Request('POST', Uri.parse('https://fathomless-beyond-10355.herokuapp.com/api/v1/registerUser'));
//   request.body = '''{   \r\n"firstName":"sam",\r\n"lastName": "Awosola",\r\n"phoneNumber": "0987086567",\r\n"email": "ocode@gmail.com",\r\n"password": "1234"\r\n}''';
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   }
//   else {
//   print(response.reasonPhrase);
//   }
// }
