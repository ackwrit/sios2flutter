import 'dart:typed_data';

import 'package:firsapplicationsio2/functions/FirestoreHelper.dart';
import 'package:firsapplicationsio2/library/constant.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{
  //Variable
  String? urlChemin;
  String? imageName;
  Uint8List? imageByte;

  ////////

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: bodyPage(),
      )

    );
  }


  boiteDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Souhaitez enregistrer cette image"),
            content: Image.memory(imageByte!),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Annuler")
              ),

              ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().stockageImage(imageName!, imageByte!).then((value){
                      setState(() {
                        urlChemin = value;
                        monProfil.avatar = urlChemin;
                      });
                      Map<String,dynamic> map ={
                        "AVATAR":urlChemin,
                      };
                      FirestoreHelper().updateUser(monProfil.id, map);
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Enregsiter")
              ),
            ],
          );
        }
    );
  }

  recuperImage() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if(result!= null){
      imageName = result.files.single.name;
      imageByte = result.files.single.bytes;
      boiteDialog();
    }
  }

  Widget bodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Avatar
        InkWell(
          onTap: (){
            recuperImage();
          },

          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: (monProfil.avatar==null)?NetworkImage("https://firebasestorage.googleapis.com/v0/b/projetsios2.appspot.com/o/noPicture.jpeg?alt=media&token=c9128039-4b47-463a-aa3a-996b53fde8bf"):NetworkImage(monProfil.avatar!)
                )
            ),
          ),
        ),




        // Afficher notre nom et prénom
        Text("${monProfil.prenom} ${monProfil.nom}"),

        //Afficher l'adresse mail
        Text("${monProfil.mail}"),
      ],
    );
  }

}