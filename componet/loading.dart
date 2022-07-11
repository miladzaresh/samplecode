import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 85,
        width: 85,
        child: Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'صبر کنید!',
                  style: TextStyle(color: Colors.redAccent, fontSize: 14, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
