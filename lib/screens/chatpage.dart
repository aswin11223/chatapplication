import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatapplication_19/auth/authservice.dart';
import 'package:flutter_chatapplication_19/componenets/chat_bubble.dart';
import 'package:flutter_chatapplication_19/componenets/my_textfield.dart';
import 'package:flutter_chatapplication_19/services/chatservices.dart';

class ChatPage extends StatelessWidget {
String reciveremail;
String receiverId;

   ChatPage({super.key,required this.reciveremail,required this.receiverId});

   //text controller
   final TextEditingController message_con=TextEditingController();
    final Chatservices _chatservices=Chatservices();
    final Authservice _authservice=Authservice();
    //send message
  void  sendmesage()async{
    //if there is something in side the textfield
    if(message_con.text.isNotEmpty){
      await _chatservices.sendMessage(receiverId, message_con.text);
      //clear textcontroller
      message_con.clear();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(reciveremail,style: TextStyle(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w800),),),

body: Column(children: [

  //display all the messages
  Expanded(child: _buildmessagelist()),

  _builduserinput()
],),

    );

  }
  //build messagelist
  Widget _buildmessagelist(){
    String senderid=_authservice.getcurrentuser()!.uid;
    return StreamBuilder(stream: _chatservices.getMessages(receiverId, senderid),
    
     builder:(context,snapshot){
      //errors
      if(snapshot.hasError){
        return const Text("error");
      }
      //loading
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Text("Loading.....");
      }

      return ListView(
        children: snapshot.data!.docs.map((doc) => _buildmessageitem(doc)).toList(),
      );
     } );
  }

  Widget _buildmessageitem(DocumentSnapshot doc){
    Map<String,dynamic>data=doc.data() as Map<String,dynamic>;

    bool iscurrentuser=data['senderId']==_authservice.getcurrentuser()!.uid;
  var alignment=iscurrentuser ?Alignment.centerRight:Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column
      
      (
        crossAxisAlignment: iscurrentuser?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children:[ 
   ChatBubble(message: data['message'], iscurrentuser: iscurrentuser),
    

        ]));
  }
Widget _builduserinput(){
  return Padding(
    padding: EdgeInsets.only(bottom: 50),
    child: Row(
      children: [
        Expanded(child: Textfieldd(hinttexxt: "type a message", obs:false, textcont: message_con)
        
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle
          ),
          child: IconButton(onPressed: sendmesage, icon: const Icon(Icons.arrow_upward)))
      ],
    ),
  );
}

}