import 'package:firsapplicationsio2/functions/FirestoreHelper.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }

}


class registerState extends State<register>{
  //Variable
  late String mail;
  late String password;
  late String nom;
  late String prenom;



  /////////////////////

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
      ),
      body: newBody(),
    );
  }

  Widget newBody(){
    return Column(
      children: [
        TextField(
          onChanged: (value){
            setState(() {
              mail = value;

            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Entrer votre adresse mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
        ),

        SizedBox(height: 15,),





        TextField(
          onChanged: (value){
            setState(() {
              password = value;

            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Entrer votre mot de passe",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),
        ),

        SizedBox(height: 15,),







        TextField(
          onChanged: (value){
            setState(() {
                prenom = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Entrer votre prénom",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),
        ),
        SizedBox(height: 15,),







        TextField(
          onChanged: (value){
            setState(() {
                    nom = value;
            });
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Entrer votre nom",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),
        ),
        SizedBox(height: 15,),

        ElevatedButton(
            onPressed: (){
              FirestoreHelper().createUser(mail, password, nom, prenom);
            },
            child: Text("S'inscrire")
        )




      ],
    );
  }

}
