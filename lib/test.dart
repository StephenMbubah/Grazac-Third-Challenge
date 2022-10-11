import 'package:flutter/material.dart';
import 'package:untitled4/api.dart';
import 'package:untitled4/ticketview.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/provider.dart';
// import '../widgets/petCard.dart';


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
    // bookTicket(seats, from, destination, reservation, time);
    super.initState();
    // ProviderClass().get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          // future: bookTicket(seats, from, destination, reservation, time),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot !=null){
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      // child:new_ticket()
                    );
                  });
            }else{
              return CircularProgressIndicator();
            }
          },),
      ),
    );
    // var data = Provider.of<ProviderClass>(context,);
    // return RefreshIndicator(
    //   onRefresh: ()async{
    //     await data.get();
    //   },
    //   child: Center(
    //     child: Consumer<ProviderClass>(
    //       builder: (ctx, value, child) {
    //         return  Container(
    //           height: MediaQuery.of(context).size.height,
    //           width: double.infinity,
    //           child: FutureBuilder(
    //               future: ProviderClass().get(),
    //               builder: (context, snapshot) {
    //                 return !snapshot.hasData && !snapshot.hasError ?
    //                 const Center(
    //                   child: SizedBox(
    //                     height: 50,
    //                     width: 50,
    //                     child: CircularProgressIndicator(
    //                       valueColor:
    //                       AlwaysStoppedAnimation<Color>(Colors.blue),
    //                     ),
    //                   ),
    //                 )
    //                     : snapshot.hasError ?
    //                 Text('Something went wrong ',textAlign: TextAlign.center,)
    //                     : ListView.builder(
    //                   itemCount: snapshot.data!.data!.length,
    //                   itemBuilder: (context, index) {
    //                     final apidata = snapshot.data!.data!;
    //                     print(apidata);
    //                     return PetCard(
    //                         sId: apidata[index].sId!.toString(),
    //                         breed: apidata[index].breed!.toString(),
    //                         age: apidata[index].age!.toString(),
    //                         isAvailable: apidata[index].isAvailable!,
    //                         petPicture: apidata[index].petPicture!.toString(),
    //                         cost: apidata[index].cost!.toString()
    //                     );
    //                   },
    //                 );
    //               }
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );

  }
}
