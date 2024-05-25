import 'package:flutter/material.dart';

import 'package:flutter_chatapplication_19/auth/authservice.dart';

import 'package:flutter_chatapplication_19/componenets/my_button.dart';
import 'package:flutter_chatapplication_19/componenets/my_textfield.dart';
class RegisterPage extends StatelessWidget {
final TextEditingController email_con = TextEditingController();
  final TextEditingController passs_con = TextEditingController();
  final TextEditingController confirm_pass = TextEditingController();

void Function()? onTap;

//password match ->create user
 
   RegisterPage({super.key,required this.onTap});
   

    void register(BuildContext context){
final _auth=Authservice();
if(passs_con.text==confirm_pass.text){
  try{
    _auth.signupwithemailandpassowrd(email_con.text, passs_con.text);
  }catch(e){
showDialog(context: context, builder: (context)=>AlertDialog(
  title: Text(e.toString()),
));
  }

}
//password not match ->tell user to fix it
else{
  showDialog(context: context, builder: (context)=>const AlertDialog(
  title: Text("password don't match"),
));
}


  }


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
              "Lets Create An Account For You!",
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
              textcont: passs_con,
              obs: true,
              hinttexxt: "password",
            ),
            const SizedBox(height: 15),

               Textfieldd(
              textcont: confirm_pass,
              obs: true,
              hinttexxt: "confirm password",
            ),
             const SizedBox(height: 15),



            Mybutton(
              textt: "Register",
              ontapp: ()=>register(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All ready have an  Account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap:onTap ,
                  child: Text(
                    "login now",
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