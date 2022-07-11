import 'package:flutter/material.dart';
import 'package:takfoodowner/componet/detail_widget.dart';
import 'package:takfoodowner/componet/line_chart.dart';
import 'package:takfoodowner/componet/order_item.dart';
import 'package:takfoodowner/utils/valueutils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late bool isOnline = true;
  late bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  showAlarm() {
    final okBtn = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "بستن پیغام ",
        style: TextStyle(color: Colors.blue.shade300),
      ),
    );
    AlertDialog alert = AlertDialog(
      content: Text(isOnline ? "فروشگاه شما آنلاین می باشد" : "فروشگاه شما آفلاین می باشد"),
      actions: [okBtn],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) => NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "داشبورد",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'iy'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const MyLineChart(),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "آمار کلی",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: ValueUtility.titleBoldSze),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DetailWidget('موجودی حساب', '25000'),
                      SizedBox(
                        width: 15,
                      ),
                      DetailWidget('سفارشات امروز', '25')
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "سفارشات جاری ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: ValueUtility.titleBoldSze),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ]),
          ),
        ];
      },
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => OrderItem(),
          ),
        ),
      ));
}
