import 'package:flutter/material.dart';

class TomanWidget extends StatelessWidget {
  const TomanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: const [
          Text(
            "تومان",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
          SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
