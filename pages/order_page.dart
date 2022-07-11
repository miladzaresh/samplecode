import 'package:flutter/material.dart';
class OrderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>OrderPageState();
}
class OrderPageState extends State<OrderPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "به زودی",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black
        ),
      ),
    );
  }

}