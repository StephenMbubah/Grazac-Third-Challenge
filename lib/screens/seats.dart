import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/api.dart';
import 'package:untitled4/screens/test.dart';
import 'package:untitled4/screens/ticket.dart';

class Seats extends StatefulWidget {
  const Seats({Key? key}) : super(key: key);

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
String dropdownValue= 'Abeokuta';
String dropdownValue1= 'Choose Your Destination';
String dropdownValue3 ='Class';
String dropdownValue2= '₦1000';
String dropdownValue5= 'Pick a seat';
bool isTap= false;
final TextEditingController _date = TextEditingController();
final TextEditingController _fromTextController = TextEditingController();
final TextEditingController _toTextController = TextEditingController();
final TextEditingController _classTextController = TextEditingController();
final TextEditingController _price = TextEditingController();
final TextEditingController _time = TextEditingController();
final TextEditingController _bookseat  = TextEditingController();

  @override
  Widget build(BuildContext context) {
   var _api = Provider.of<testingProvider>(context);
    final format = DateFormat('h:mma');
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            title: const Text('Book your Tickets'),
            backgroundColor: Colors.green,
          ),
          backgroundColor:Color(0xFFeeedf2),
          body: Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:15),
                  Text('Location'),
                  SizedBox(height: 13),
                  TextFormField(
                    controller: _fromTextController,
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),

                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['Abeokuta']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 25, color: Colors.black),),
                            );
                          }).toList(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.arrow_downward,),
                  SizedBox(height: 13),
                  TextFormField(
                    controller: _toTextController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: DropdownButton<String>(
                          value: dropdownValue1,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue1 = newValue!;
                            });
                          },
                          items: <String>['Choose Your Destination','Yola', 'Bauchi', 'Makurdi', 'Maidugri','Jigawa','Gombe','Kaduna','Kano','Katsina','Kebbi','Kogi','Minna','Sokoto','Jalingo','Damaturu','Lafia']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _classTextController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: DropdownButton<String>(
                          value: dropdownValue3,
                          elevation: 16,
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue3 = newValue!;
                            });
                          },
                          items: <String>["Class",'Business Class','Economy Class','First Class']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Price'),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),

                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue!;
                            });
                          },
                          items: <String>['₦1000','₦2000','₦3000','₦6000','₦7000','₦8000','₦9000','₦10,000','15000','₦12,000','₦5000']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text('Date'),
                  TextFormField(
                    controller:_date,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Select Date',
                    ),
                    onTap: () async{
                      DateTime? pickeddate= await showDatePicker(
                          context: context,
                          initialDate:DateTime.now(), firstDate: DateTime(2000),
                          lastDate: DateTime(2101));

                      if(pickeddate !=null){
                        setState((){
                          _date.text=DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  const Text('Time'),
                  Container(
                    padding: EdgeInsets.all(16),
                    child:
                    DateTimeField(
                        controller: _time,
                        format: format,
                        decoration:const  InputDecoration(
                            hintText: 'Choose Time'
                        ),
                        onShowPicker: (context,currentValue) async{
                          final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(currentValue?? DateTime.now()));
                          return DateTimeField.convert(time);
                        }
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Book Seat'),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _bookseat,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: DropdownButton<String>(
                          value: dropdownValue5,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue5 = newValue!;
                            });
                          },
                          items: <String>['Pick a seat','1','2','3','4','5','6','7','08','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  if(isTap)
                    CircularProgressIndicator(),
                  if(!isTap)
                  GestureDetector(
                    onTap: ()async{
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AllTickets()));
                      await _api.bookTicket(
                        _bookseat.toString(),
                          _classTextController.toString(),
                          _fromTextController.toString(),
                          _toTextController.toString(),
                          _time.toString(),
                      ).then(
                            (value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>AllTickets())),
                      );
                      setState(() {
                        isTap=true;
                      });
                    },
                     child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      height: 50,
                      width: double.infinity,
                      child: const Center(
                          child: Text("Book Ticket",textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold),),
                      )
                  ))
           ],

           ),
            ),
          ),
    )
    );
  }
}
