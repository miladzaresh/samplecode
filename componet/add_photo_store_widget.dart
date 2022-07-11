import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddPhotoStoreWidget extends StatefulWidget{

  final image;

  AddPhotoStoreWidget(this.image);

  @override
  State<StatefulWidget> createState() =>AddPhotoStoreWidgetState();
}
class AddPhotoStoreWidgetState extends State<AddPhotoStoreWidget>{
  @override
  Widget build(BuildContext context) =>Container(
    padding: EdgeInsets.all(15),
    alignment: Alignment.center,
    color: Colors.black45,
    height: 165,
    width: double.infinity,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(widget.image),fit: BoxFit.cover
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.2,0.2),
                    color: Colors.grey.shade600,
                    spreadRadius: 0.5
                )
              ]
          ),
        ),
        Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.2,0.2),
                  color: Colors.black38,
                  spreadRadius: 0.5,
                )
              ]
          ),
          child: Icon(Icons.edit,color: Colors.white,size: 24,),
        )

      ],
    ),
  );
  
}