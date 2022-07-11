import 'package:flutter/material.dart';
import 'package:takfoodowner/componet/product_item.dart';

import 'toman_widget.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        '260,000',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      TomanWidget(),
                    ],
                  ),
                  const Text('26 اسفند', style: TextStyle(fontSize: 12)),
                  const Text(
                    "شناسه : 156358",
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text(
                    "توضیحات:",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 95,
                    width: 85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey.shade300),
                        image: const DecorationImage(image: AssetImage(''), fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "داوود میرزاخانی",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          "سس هم اضافه کنید",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
        const ProductItem(),
        const ProductItem(),
        const Divider(
          height: 40,
          thickness: 1,
        )
      ],
    );
  }
}
