import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget{
  final label;
  final type;
  final maxLines;
  final hint;
  final controller;

  CustomTextFieldWidget({this.hint,this.type,this.label,this.maxLines,this.controller});

  @override
  Widget build(BuildContext context) =>Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade500,
        ),
      ),
      TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300,width: 1),
            borderRadius: BorderRadius.circular(5)
          ),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300,width: 1),
              borderRadius: BorderRadius.circular(5)
          ),
          contentPadding: EdgeInsets.all(5),
          suffixIcon: IconButton(
            icon: Icon(Icons.close,size: 15,color: Colors.grey.shade300,),
            onPressed: (){
              controller.text="";
            },
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),

      )
    ],
  );

}