
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatelessWidget{
  final  selectValue;
  final  items;
  final onChanged;
  final context;
  final label;

  CustomDropdownWidget
      (
      {
        required this.label,
        required this.context,
        required this.items,
        required this.selectValue,
        required this.onChanged
      }
      );

  @override
  Widget build(BuildContext context) =>Expanded(child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey.shade500,
        ),
      ),
      OutlineButton(
        padding: EdgeInsets.all(10),
        borderSide: BorderSide(color: Colors.grey.shade300,width: 1),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return Container(
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)

                  )
              ),
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemBuilder:(context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(items[index],textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade900,fontSize: 15),),
                      onTap: (){
                        onChanged(items[index]);
                      },
                    ),
                    Divider(height: 1,color: Colors.grey.shade300,)
                  ],
                ),
                itemCount: items.length,
              ),
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectValue,textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15),),
            Icon(Icons.keyboard_arrow_down_rounded,size: 24,color: Colors.grey.shade300,)
          ],
        ),
      )
    ],
  ));


}