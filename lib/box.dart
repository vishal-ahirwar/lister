import 'package:flutter/material.dart';

    class FlutterBox extends StatelessWidget {
      const FlutterBox({Key? key}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return   Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red
                  ]
              ),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 5)]),
          width: 100,
          height: 100,
          child: const Text("Hi Flutter",style: TextStyle(color: Colors.white),),
        );
      }
    }
    