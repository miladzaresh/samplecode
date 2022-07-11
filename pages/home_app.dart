import 'package:flutter/material.dart';
import 'package:takfoodowner/pages/home_page.dart';
import 'package:takfoodowner/pages/order_page.dart';
import 'package:takfoodowner/pages/product_page.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';
import 'package:takfoodowner/utils/valueutils.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  final scafoldKey = GlobalKey<ScaffoldState>();
  late int currentPage = 0;
  late bool isOnline = true;
  final Map<int, Widget> bottomNavItem = {
    0: const HomePage(),
    1: ProductPage(),
    2: OrderPage(),
  };

  @override
  void initState() {
    super.initState();
  }

  showAlarm() {
    final okBtn = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        "باشه",
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scafoldKey,
      appBar: AppBar(
        actions: [
          Container(
            child: Switch(
                value: isOnline,
                activeColor: Theme.of(context).primaryColor,
                onChanged: (value) {
                  setState(() {
                    isOnline = value;
                    showAlarm();
                  });
                }),
            margin: const EdgeInsets.only(left: 15),
          )
        ],
        title: TextButton.icon(
          label: const Text('نخل طلایی'),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: const Center(
                      child: Text("به زودی "),
                    ),
                  );
                });
          },
        ),
        leading: Container(
          margin: const EdgeInsets.only(right: 10),
          // padding: const EdgeInsets.all(2.0),
          child: const CircleAvatar(
              // backgroundImage: AssetImage(),
              //radius: 50,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: bottomNavItem[currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'خانه'),
          BottomNavigationBarItem(icon: Icon(Icons.store_outlined), label: 'محصولات'),
          BottomNavigationBarItem(icon: Icon(Icons.note_outlined), label: 'سفارشات'),
        ],
        onTap: (index) => setState(() {
          currentPage = index;
        }),
        currentIndex: currentPage,
      ),
    );
  }
}
