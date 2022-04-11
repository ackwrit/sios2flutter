import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firsapplicationsio2/functions/FirestoreHelper.dart';
import 'package:firsapplicationsio2/model/Utilisateur.dart';
import 'package:firsapplicationsio2/myWidgets/myDrawer.dart';
import 'package:flutter/material.dart';
class dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashboardState();
  }

}


class dashboardState extends State<dashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/1.5,
        child: myDrawer(),
      ),
      appBar: AppBar(
        title: Text("Page Principal"),
      ),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreHelper().fire_user.snapshots(),
        builder: (context,snapshot){
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }
        else
          {
            List documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
                itemBuilder: (context,index){
                Utilisateur user = Utilisateur(documents[index]);
                return ListTile(
                  title: Text("${user.prenom} ${user.nom}"),
                  subtitle: Text("${user.mail}"),
                );
                }
            );
          }
        }
    );
  }

}