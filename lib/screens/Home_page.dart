import 'package:flutter/material.dart';

import 'package:flutter_chatapplication_19/auth/authservice.dart';
import 'package:flutter_chatapplication_19/componenets/components.dart';
import 'package:flutter_chatapplication_19/componenets/usertile.dart';
import 'package:flutter_chatapplication_19/screens/chatpage.dart';
import 'package:flutter_chatapplication_19/services/chatservices.dart';

class Homepage extends StatelessWidget {
  void logout() async {
    final _auth = Authservice();
    await _auth.signout();
  }

  Homepage({super.key});
  Authservice _authservice = Authservice();
  Chatservices _chatservices = Chatservices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Home page",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_rounded))
        ],
      ),
      drawer: Mydrwer(),
      body: _builduserlist(),
    );
  }

  Widget _builduserlist() {
    return StreamBuilder(
        stream: _chatservices.getUserStream(),
        builder: (context, snapshot) {
          //error

          if (snapshot.hasError) {
            return Text("error");
          }
          //loading

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading");
          }

          final users = snapshot.data as List<Map<String, dynamic>>;

          //return listview

          return ListView(
            children: users
                .map<Widget>(
                    (userdata) => _builduserlistitem(userdata, context))
                .toList(),
          );
        });
  }

  //build individual list tile for user
  Widget _builduserlistitem(
      Map<String, dynamic> userdata, BuildContext context) {
    if(userdata["email"]!=_authservice.getcurrentuser()){
      return Usertile(
        text: userdata["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ChatPage(reciveremail: userdata["email"],receiverId: userdata['uid'],)));
        });
    }
    else{
      return Container();
    }
  }
}
