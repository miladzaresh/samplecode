import 'package:flutter/material.dart';
import 'package:takfoodowner/pages/search_page.dart';

class SearchWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context)=>Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
        ]),
    child: ListTile(
      onTap: ()async{
        await Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) =>
             SearchPage(),
        ));
      },
      trailing: Icon(Icons.search,size: 24,color: Colors.grey.shade500 ,),
      title: Text("جست و جو در محصولات ",style: TextStyle(color:  Colors.grey.shade500,fontSize: 15),),
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}