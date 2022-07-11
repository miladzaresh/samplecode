import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:takfoodowner/models/order_model.dart';

class OrderController extends ChangeNotifier{
  late List<OrderModel> models=[];

  fetchData(){
    List<OrderModel> model=[];

    List<ContentOrder> contents=[];
    int sumSell=0;
    contents.add(ContentOrder("assets/images/person.png", "پیتزا تک نفره مخصوص", 60000,2));
    contents.add(ContentOrder("assets/images/person.png", "پیتزا تک نفره مخصوص", 60000,2));
    contents.add(ContentOrder("assets/images/person.png", "پیتزا تک نفره مخصوص", 60000,2));

    for(ContentOrder co in contents)
      sumSell+=co.price;

    model.add(OrderModel(123, "7 دقیقه پیش", "assets/images/person.png", 12000, true, "موفق آمیز بود", contents, sumSell,"رضا اسدی"));
    model.add(OrderModel(123, "7 دقیقه پیش", "assets/images/person.png", 152000, false, "موفق آمیز نبود", contents, sumSell,"رضا اسدی"));
    model.add(OrderModel(123, "7 دقیقه پیش", "assets/images/person.png", 352000, true, "موفق آمیز بود", contents, sumSell,"رضا اسدی"));

    models.addAll(model);
    print(models.length);
    print(model.length);


    //notifyListeners();

  }
}