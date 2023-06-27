import 'package:flutter/material.dart';
class AccountDrawer extends StatelessWidget {
  const AccountDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(0),
      child: Drawer(
        backgroundColor: Colors.black45,

        elevation: 45,
          child:ListView(
            children: const [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black45),
                accountName: Text("Vishal Ahirwar",style: TextStyle(color: Colors.white),),
                accountEmail: Text("vishal.ahirwar.in@outlook.com",style: TextStyle(color: Colors.white),),
                currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/p.jpg"),),
              ),
              ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Icon(Icons.person,color: Colors.white,),
                title: Text("Vishal Ahirwar"),
                subtitle: Text("C++ Software Developer"),
              )
            ],
          )
      ),
    );
  }
}
