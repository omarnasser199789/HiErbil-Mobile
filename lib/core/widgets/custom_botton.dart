import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Theme/style.dart';
import 'package:shimmer/shimmer.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.loading,
      required this.title,
       this.onTap,
      this.fontSize,
      this.borderRadius,
      this.width,

      this.height,
        this.loadingTitle,
        this.icon,
      this.color,
        this.svg,
      this.textColor})
      : super(key: key);

  final String title;

  final String ? loadingTitle;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final bool? loading;
  final Function()  ? onTap;
  final Icon ? icon;
  final String ? svg;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: (widget.loading == null || widget.loading == false)
          ? GestureDetector(
        onTap: widget.onTap,
            child: Container(
                width: (widget.width != null) ? widget.width : double.infinity,
                height: (widget.height != null) ? widget.height : 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: (widget.borderRadius != null)
                      ? BorderRadius.circular(widget.borderRadius!)
                      : BorderRadius.circular(10),
                  color: (widget.color != null)
                      ? widget.color
                      : Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(widget.svg!=null)
                      SvgPicture.asset(widget.svg!,color: Colors.white,),

                    Text(
                      widget.title,
                      style: poppinsMediumTextStyle(
                          context: context,
                          fontSize: (widget.fontSize != null) ? widget.fontSize! : 14,
                          color: (widget.textColor != null)
                              ? widget.textColor
                              : Colors.white),
                    ),

                    if(widget.icon!=null)
                    widget.icon!,


                  ],
                ),
              ),
          )
          : Stack(
              alignment: Alignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: (widget.color != null)
                      ? widget.color!
                      : Theme.of(context).primaryColor,
                  highlightColor: Colors.white,
                  child: Container(
                    width:
                        (widget.width != null) ? widget.width : double.infinity,
                    height: (widget.height != null) ? widget.height : 44,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: (widget.borderRadius != null)
                          ? BorderRadius.circular(widget.borderRadius!)
                          : BorderRadius.circular(10),
                      color: (widget.color != null)
                          ? widget.color
                          : const Color.fromRGBO(236, 82, 82, 1),
                    ),
                    child: Text(
                      widget.title,
                      style: blackBoldTextStyle(
                          context: context,
                          fontSize:
                              (widget.fontSize != null) ? widget.fontSize! : 14,
                          color: (widget.textColor != null)
                              ? widget.textColor
                              : Colors.white),
                    ),
                  ),
                ),
                Text(
                  (widget.loadingTitle!=null)? widget.loadingTitle!:
    "الرجاء الانتظار",
                  style: blackBoldTextStyle(
                      fontSize: 14,
                      context: context,
                      color: (widget.textColor != null)
                          ? widget.textColor!
                          : Colors.white),
                ),
              ],
            ),
    );
  }
}

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8.0),
// ),
// primary: const Color(0xff1b447b),
// ),
