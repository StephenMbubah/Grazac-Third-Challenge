import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:untitled4/provider/api.dart';
import 'package:untitled4/widgets/thickcontainer.dart';
import 'package:untitled4/widgets/ticketview.dart';
// import 'package:provider/provider.dart';
//

class AllTickets extends StatefulWidget {
  const AllTickets({
    Key? key,
  }) : super(key: key);

  @override
  State<AllTickets> createState() => _AllTicketsState();
}

class _AllTicketsState extends State<AllTickets> {

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      var _api = Provider.of<testingProvider>(context,listen: false);
      _api.get();

    } );
    super.initState();
    // ProviderClass().get();
  }

  @override
  Widget build(BuildContext context) {
    var _api = Provider.of<testingProvider>(context);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          // future: bookTicket(seats, from, destination, reservation, time),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot !=null){
              return ListView.builder(
                itemCount: _api.allServices.length,
                  itemBuilder: (context, index) {
                    var data= _api.allServices[index];
                    return Slidable(
                      startActionPane:ActionPane(motion: ScrollMotion(),
                        children:[SlidableAction
                          (onPressed: (_) {}, icon:Icons.menu),
                        ],
                      ),
                      endActionPane: ActionPane(motion:ScrollMotion(),
                          children: [SlidableAction
                            (onPressed:(_) {
                              data.delete();

                          }, icon:Icons.delete,
                          )]
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF526799),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(21),
                                topRight: Radius.circular(21),
                              ),
                            ),
                            margin: EdgeInsets.only(left: 2),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Abeokuta',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    ThickContainer(),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                print(
                                                    'The width is ${constraints.constrainWidth()}');
                                                return Flex(
                                                  direction: Axis.horizontal,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: List.generate(
                                                      (constraints.constrainWidth() / 6)
                                                          .floor(),
                                                          (index) => SizedBox(
                                                        width: 3,
                                                        height: 1,
                                                        child: DecoratedBox(
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      )),
                                                );
                                              },
                                            ),
                                          ),
                                          Center(
                                              child: Icon(Icons.train, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    ThickContainer(),
                                    Expanded(child: Container()),
                                    Text(
                                      '₦15000',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:3),
                                Icon(Icons.arrow_downward,color: Colors.white),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        data['train_destination_from_to'].toString().substring(9),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '10H 30M',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        '',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Color(0xFFF37B66),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 19,
                                  height: 9,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(9),
                                        bottomRight:Radius.circular(9),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.all(11),
                                  child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                                    return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate((constraints.constrainWidth()/14).floor(), (index) => SizedBox(
                                          width: 4,
                                          height: 0,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ))
                                    );
                                  },
                                  ),
                                )),
                                SizedBox(
                                  width: 19,
                                  height: 9,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(9),
                                        bottomLeft:Radius.circular(9),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF37B66),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            margin: EdgeInsets.only(left: 1),
                            padding: EdgeInsets.only(left: 15,top:10,right: 16,bottom: 16),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '19 August',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          data['bookingPeriod'].toString().substring(0,8),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Departure time',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          child: Text(
                                            'Book Seat',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: (){
                                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Seats()));
                                          },
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          data['trainSeats'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    );
                  });
            }else{
              return CircularProgressIndicator();
            }
          },),
      ),
    );
  }
}
