import 'package:flutter/material.dart';
import 'package:flutter_chatapplication_19/login.dart';
import 'package:flutter_chatapplication_19/screens/sign_up.dart';

class loginorreg extends StatefulWidget {
   loginorreg({super.key});

  @override
  State<loginorreg> createState() => _loginorregState();
}

class _loginorregState extends State<loginorreg> {
  bool showloginpage=true;

  void   togglepages (){
    setState(() {
      showloginpage=!showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showloginpage){
      return Login(onTap: togglepages);

    }else{
      return RegisterPage(onTap: togglepages);
    }
  }
}