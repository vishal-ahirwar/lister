import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CH1_Card.dart';
import 'ch_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var name_text="None";
  TextEditingController name_text_controller=new TextEditingController();

  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(iconTheme: const IconThemeData(color: Colors.white),elevation: 0,backgroundColor: Colors.transparent,title:const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text("Profiles",style: TextStyle(color: Colors.white),),Text("Made with ❤️ by Vishal.",style: TextStyle(color: Colors.white,fontSize: 12,),textAlign: TextAlign.center,),Icon(Icons.search_sharp,color: Colors.white,)]),systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
      body: data!=null?SingleChildScrollView(
        padding: const EdgeInsets.all(8),
      child:Padding(
        padding: const EdgeInsets.all(1.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 800,
              child: ListView.builder(itemCount: 50,itemBuilder: (BuildContext context,int index){
                return
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12),
                          width: 360,

                          decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.circular(8),),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(backgroundImage: NetworkImage(data[index]["avatar"]),),
                                  Text(data[index]["first_name"]+ " "+ data[0]["last_name"],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                                  Text(data[index]["username"],style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 14)),
                                ],
                              ),
                              Text(data[index]["email"],style:const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 14),textAlign: TextAlign.center,),
                              Text(data[index]["phone_number"],style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 14)),
                              Text(data[index]["date_of_birth"],style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w100,fontSize: 14)),

                            ],
                          )

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
              }),
            )
          ],
        ),
      )
      ):const Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [CircularProgressIndicator(color: Colors.white,backgroundColor: Colors.blue,semanticsLabel: "Loading"),Text("Downloading Data From Server...",style: TextStyle(color: Colors.blue),),])),
      floatingActionButton: FloatingActionButton(onPressed: (){
        data=null;
        setState(() {});
        fetchData();
      },child: Icon(Icons.refresh),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer:AccountDrawer(),
      drawerScrimColor: Colors.black45,
    );
  }

  void fetchData()async {
    var res=await http.get(Uri.parse(("https://random-data-api.com/api/v2/users?size=50&is_xml=false")));
    data=jsonDecode(res.body);
    print(data.toString());
    setState(() {

    });
  }
}

