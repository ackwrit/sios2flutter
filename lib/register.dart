import 'package:flutter/material.dart';

class register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }

}


class registerState extends State<register>{
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
    return Text("coucou");
  }

}
