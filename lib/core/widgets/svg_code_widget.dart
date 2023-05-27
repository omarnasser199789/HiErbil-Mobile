import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Theme/theme_values.dart';

class SvgCodeWidget extends StatefulWidget {
  const SvgCodeWidget({Key? key, this.svg,this.code}) : super(key: key);
  final String ? svg;
  final String ? code;

  @override
  State<SvgCodeWidget> createState() => _SvgCodeWidgetState();
}

class _SvgCodeWidgetState extends State<SvgCodeWidget> {
  String svgCode="";
  @override
  Future<void> didChangeDependencies() async {
    String  code="";
    if(widget.svg!=null){
        code = await rootBundle.loadString(widget.svg!);
    }else{
      code=widget.code!;
    }


    print("££££££££££");
    print(primaryColorTypeString);
    print("££££££££££");

      svgCode=  code.replaceAll("ec5252",primaryColorTypeString);



    if (!mounted) {
      return;
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(svgCode);
  }
}
