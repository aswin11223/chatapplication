import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_chatapplication_19/auth/authservice.dart';
import 'package:flutter_chatapplication_19/componenets/my_button.dart';
import 'package:flutter_chatapplication_19/componenets/my_textfield.dart';

class Login extends StatelessWidget {
  final TextEditingController email_con = TextEditingController();
  final TextEditingController pass_con = TextEditingController();
   void Function()? onTap;

//login
  void login(BuildContext context)async {
  final authservice=Authservice();
  try{
    await authservice.signinwithemailpassword(email_con.text,pass_con.text);
  }catch(e){
    showDialog(context: context, builder:(context)=>AlertDialog(
      title: Text(e.toString()),
    ));
  }

  }


 

  Login({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "welcome back,you have been missed!",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            Textfieldd(
              textcont: email_con,
              obs: false,
              hinttexxt: "Email",
            ),
            Textfieldd(
              textcont: pass_con,
              obs: true,
              hinttexxt: "password",
            ),
            const SizedBox(height: 15),
            Mybutton(
              textt: "Login",
              ontapp: ()=>login(context)
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap:onTap ,
                  child: Text(
                    "register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
