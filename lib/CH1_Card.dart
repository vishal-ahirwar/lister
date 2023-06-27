import 'package:flutter/material.dart';
class CH_CARD extends StatelessWidget {
  const CH_CARD({Key? key,required String txt,required TextEditingController controller}) :name_text=txt,name_text_controller=controller, super(key: key);
  final String name_text;
  final TextEditingController name_text_controller;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Column(
        children: <Widget>[
          Image.asset("assets/bg.jpg",alignment: Alignment.center,),
          const SizedBox(
            height: 20,
          ),
          Text(name_text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          TextField(
            controller: name_text_controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Your Name",labelText: "Name"),
          )
        ],
      ),
    );
  }
}
