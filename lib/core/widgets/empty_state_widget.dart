import 'package:flutter/material.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/services.dart';
import '../../Theme/style.dart';
import 'package:flutter_svg/svg.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({Key? key,required this.svg,
    required this.text1,
    this.text2,
     this.text3,
     this.onTap,
  }) : super(key: key);

  final String svg;
  final String text1;
  final String ? text2;
  final String? text3;

  final Function () ? onTap;

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget> {
  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(widget.svg,),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(widget.text1,style: poppinsMediumTextStyle(fontSize: 14, context: context),),
          ),
          if(widget.text3!=null)
          GestureDetector(
            onTap: widget.onTap,

            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.01),
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(widget.text3!,style: blackBoldTextStyle(fontSize: 13, context: context,
                    color: (widget.onTap!=null)?Theme.of(context).primaryColor:null),),
              ),
            ),
          ),
          const  SizedBox(height: 130,),
        ],
      ),
      beginOffset: const Offset(0, 1),
      endOffset: const Offset(0, 0),
    );
  }
}