import 'package:flutter/material.dart';

import 'package:flutter_chatapplication_19/auth/authservice.dart';
import 'package:flutter_chatapplication_19/screens/setting.dart';

class Mydrwer extends StatelessWidget {
  const Mydrwer({super.key});

  void logout()async{
    final _auth=Authservice();
    _auth.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
        
           Padding(
             padding: const EdgeInsets.all(30.0),
             child: ListTile(
              title:Text("Home",style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.primary),) ,
              leading: Icon(Icons.home,color: Theme.of(context).colorScheme.primary,),
              onTap: (){
                Navigator.pop(context);
              },
             ),
           ),
            Padding(
             padding: const EdgeInsets.all(30.0),
             child: ListTile(
              title:Text("Settting",style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.primary),) ,
              leading: Icon(Icons.settings,color: Theme.of(context).colorScheme.primary,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
              },
             ),
           ),
            Padding(
             padding: const EdgeInsets.all(30.0),
             child: ListTile(
              title:Text("Logot",style: TextStyle(fontSize: 25,color: Theme.of(context).colorScheme.primary),) ,
              leading: Icon(Icons.logout,color: Theme.of(context).colorScheme.primary,),
              onTap: logout,
             ),
           )
        ],
      ),
    );
  }
}