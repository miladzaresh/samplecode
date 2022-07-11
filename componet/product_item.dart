import 'package:flutter/material.dart';
import 'package:takfoodowner/pages/comming_soon_page.dart';
import 'package:takfoodowner/pages/edit_product.dart';

import 'toman_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
            ]),
        child: ListTile(
          leading: const CircleAvatar(),
          title: const Text('موز'),
          dense: true,
          onTap: () async {
            await Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 400),
              pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) =>
                 CommingSoon(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ));
          },
          trailing: const Text('23000 × 2'),
          subtitle: Row(
            children: const [Text('64000'), TomanWidget()],
          ),
        ));
  }
}
