import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20),
        child: CircularProgressIndicator(
          backgroundColor: Colors.grey,
          color: Theme.of(context).primaryColor,
        )
    );
  }
}
