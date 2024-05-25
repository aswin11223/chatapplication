import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice{
  //get instance of firebase

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  User?getcurrentuser(){
     return   _auth.currentUser;
  }

  //signin

  Future<UserCredential>signinwithemailpassword(String email,password)async{
    try{
      UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: email, password: password);

   //save user info if it dosen't already exist

_firestore.collection("users").doc(userCredential.user!.uid).set({
  "uid":userCredential.user!.uid,
  "email":email


});



      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
      
    }

  }
  //signout

  Future<void>signout()async{
      return await  _auth.signOut();


  }
  //signup

  Future<UserCredential>signupwithemailandpassowrd(String email,password)async{
   try{
     UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);

//save user info in a seperate document

_firestore.collection("users").doc(userCredential.user!.uid).set({
  "uid":userCredential.user!.uid,
  "email":email


});


    return userCredential;
   }on FirebaseAuthException catch(e){
    throw Exception(e.code);
   }


  }
   
  
}