import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String title, subtitle;
  const DetailWidget(
    this.title,
    this.subtitle, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(subtitle, style: const TextStyle(color: Colors.black, fontSize: 14))
            ],
          ),
        ),
      );
}
