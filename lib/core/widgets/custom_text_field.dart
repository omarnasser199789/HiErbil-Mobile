
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../Theme/style.dart';



class CustomTextField extends StatefulWidget {
  CustomTextField({Key? key,required this.hint,
    required this.onTap,
    this.onFieldSubmitted,
    this.textAlign,
    this.keyboardType,
    this.titleColor,
    this.onEditingComplete,this.controller,
    this.isPassword,this.isSearch,this.autofocus,this.focusNode,this.textInputAction,this.inputFormatters,this.suffixIcon, this.onChange,required this.title, this.width,this.maxLength,this.maxLines}) : super(key: key);

  final String hint;
  final String title;
  final double ? width;
  final int ? maxLength;
  final int ? maxLines;
  final List<TextInputFormatter> ? inputFormatters;
  final bool ? autofocus;
  final bool ? isSearch;
  final Color ? titleColor;
  final FocusNode? focusNode;
  late  bool ? isPassword;

  late  TextAlign ? textAlign;
  late  TextInputType ? keyboardType;
  late Function () onTap;
  late FormFieldValidator<String>? onChange;
  late Function (dynamic) ? onFieldSubmitted;
  late Function () ? onEditingComplete;
  late TextEditingController ? controller;
  late Widget ? suffixIcon;
  final TextInputAction ? textInputAction;



  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
late Brightness keyboardAppearance;
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {








    if(SchedulerBinding.instance.window.platformBrightness==Brightness.light) {
      keyboardAppearance = Brightness.light;
    }else{
      keyboardAppearance = Brightness.dark;
    }




    Size size =MediaQuery.of(context).size;


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: (widget.title!="") ? CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
        if(widget.title!="")
          Padding(
            padding:  EdgeInsets.only(top: size.height*0.016741071428571428),
            child: Row(
              children: [
                Text(widget.title,style: blackBoldTextStyle(context: context,fontSize: 12,
                  color: widget.titleColor,
                ),),
              ],
            ),
          ),


        Padding(
          padding:  EdgeInsets.only(top:(widget.title!="")?size.height*0.011160714285714286:0),
          child: Container(
            width:(widget.width!=null)?widget.width: double.infinity,
            alignment: Alignment.center,
            child: TextFormField(
              focusNode: widget.focusNode,

              style: TextStyle(color: Theme.of(context).canvasColor),
              maxLength: widget.maxLength,
              controller: widget.controller,
              textAlign: (widget.textAlign!=null)?widget.textAlign!:TextAlign.start,
              keyboardType:widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditingComplete,
              onFieldSubmitted: widget.onFieldSubmitted,
              textInputAction:widget.textInputAction,
              keyboardAppearance:keyboardAppearance,
              // minLines: 2,
              maxLines: widget.maxLines,//(widget.isPassword==null&&widget.isPassword==false)?  widget.maxLines:1,
              autofocus:(widget.autofocus==null)?false:true,
              validator: widget.onChange,

              autovalidateMode: AutovalidateMode.onUserInteraction,


              obscureText: (widget.isPassword!=null&&widget.isPassword==true)? true:false,
              // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,

                hintStyle: poppinsRegularTextStyle(context: context,fontSize: 16,color: hintTextColor),
                filled: true,

                fillColor: textFormFieldFillColor,
                errorStyle: poppinsRegularTextStyle(fontSize: 11, context: context,color: Colors.red),


                suffixIcon:(widget.suffixIcon==null)? (widget.isPassword!=null&&widget.isPassword==true)? GestureDetector(
                    onTap: (){

                      setState((){
                        widget.isPassword=false;
                      });

                    },
                    child: const Icon(Icons.remove_red_eye_outlined,color: Colors.grey,)):null:widget.suffixIcon,
                prefixIcon: (widget.isSearch!=null&&widget.isSearch==true)?Icon(Icons.search,color: hintTextColor,):null,


                contentPadding: const EdgeInsets.all(11),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(50),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                  borderRadius: BorderRadius.circular(50),
                ),

                errorBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red, width: 0.0),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),

              // onChanged: ,
            ),
          ),
        ),
      ],
    );
  }
}