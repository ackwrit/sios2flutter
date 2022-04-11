

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firsapplicationsio2/model/Utilisateur.dart';

class FirestoreHelper{
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Utilisateurs");
  final fire_storage = FirebaseStorage.instance;





  Future createUser(String mail, String password, String nom, String prenom) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    String uid = resultat.user!.uid;
    Map<String,dynamic> map = {
      "NOM":nom,
      "PRENOM":prenom,
      "MAIL":mail,
    };

    addUser(uid, map);

  }

  Future <String> Connect(String mail, String password) async {
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
    return resultat.user!.uid;
  }




  addUser(String uid,Map<String,dynamic> map){
    fire_user.doc(uid).set(map);
  }
  updateUser(String uid,Map<String,dynamic>map){
    fire_user.doc(uid).update(map);
  }

  Future <Utilisateur>getUtilisateur(String uid) async {
    DocumentSnapshot snapshot = await fire_user.doc(uid).get();
    return Utilisateur(snapshot);


  }

  Future <String> stockageImage(String name,Uint8List bytesData) async {
    TaskSnapshot snapshot = await fire_storage.ref("image/$name").putData(bytesData);
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }




}