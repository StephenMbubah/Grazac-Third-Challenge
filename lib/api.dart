import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';


Future signUp (firstName,lastName,phoneNumber,email,password)async{
  try{
    Response response=await post(Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/signup"),
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


Future login (String email, password)async{
  try{
    Response response= await post(Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/login"),
    body: {
      'email': email ,
      'password': password,
  });
    if(response.statusCode==200){
      print("account Logged-In successfully");
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
    Response response = await post(
        Uri.parse("https://move-me-app.herokuapp.com/api/v1/user/login"),
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
    if (response.statusCode == 200) {
      print(await response.toString());
      print("Ticket booked successfully");
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
// Future getTicket (String seats,String from, String destination,String reservation, String time)async {
//   final storage = await SharedPreferences.getInstance();
//   token = await storage.getString('token');
//   Map<String, String> requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': '*/*',
//     'Authorization': 'Bearer $token'
//   };
//   var url =Uri.parse('https://biggievet.herokuapp.com/api/user/pets');
//   getResponse = await http.get(url, headers: requestHeaders);
//
//   print('Response status: ${getResponse.statusCode}');
//
//     if (response.statusCode == 200) {
//       print(await response.toString());
//       print("Ticket retrieved successfully");
//     }
//     if (response.statusCode == 401) {
//       print("Un-authorized");
//     }
//     else {
//       print('Response status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
//
//
//  Future get() async {
//   final storage = await SharedPreferences.getInstance();
//   token = await storage.getString('token');
//   Map<String, String> requestHeaders = {
//     'Content-type': 'application/json',
//     'Accept': '*/*',
//     'Authorization': 'Bearer $token'
//   };
//   var url =Uri.parse('https://biggievet.herokuapp.com/api/user/pets');
//   getResponse = await http.get(url, headers: requestHeaders);
//
//   print('Response status: ${getResponse.statusCode}');
//
//
//
// }
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
