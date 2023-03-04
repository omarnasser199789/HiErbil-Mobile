import 'package:flutter/material.dart';

import '../../Theme/style.dart';

class Error_Widget extends StatelessWidget {
  const Error_Widget({Key? key,this.msg}) : super(key: key);
  final String ? msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/gifs/error.gif"),width: 150,),
          if(msg!=null)
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(msg!,style: blackBoldTextStyle(context: context, fontSize: 14, color: Colors.black) ,),
          )
        ],
      )),
    );
  }
}
