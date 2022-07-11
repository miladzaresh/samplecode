import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:takfoodowner/models/product_info_model.dart';
import 'package:takfoodowner/models/search_history_model.dart';
import 'package:takfoodowner/utils/search_history_db.dart';

class OwnerProvider extends ChangeNotifier {
  late List<ProductInfoModel> products=[
    ProductInfoModel(
        "assets/images/benana.png",
        "موز",
        "میوه",
        "موجود",
        "عدد",
        "10",
        "60000",
        "موز درجه یک با کیفیت",
        [],
        "12:14",
        "15:20"
    ),ProductInfoModel(
        "assets/images/benana.png",
        "موز",
        "میوه",
        "موجود",
        "عدد",
        "10",
        "60000",
        "موز درجه یک با کیفیت",
        ["یک شنبه ","دو شنبه"],
        "12:14",
        "15:20"
    ),ProductInfoModel(
        "assets/images/benana.png",
        "موز",
        "میوه",
        "موجود",
        "عدد",
        "10",
        "60000",
        "موز درجه یک با کیفیت",
        ["یک شنبه ","دو شنبه"],
        "12:14",
        "15:20"
    ),ProductInfoModel(
        "assets/images/benana.png",
        "موز",
        "میوه",
        "موجود",
        "عدد",
        "10",
        "60000",
        "موز درجه یک با کیفیت",
        ["یک شنبه ","دو شنبه"],
        "12:14",
        "15:20"
    )
  ];
  late List<ProductInfoModel> searchModel=[];
  late List<HistorySearchModel> searchHistories=[];

  void getSearchHistoryList()async{
    searchHistories= await SearchHistoryDb().getList();
    notifyListeners();
  }
  void deleteSearchHistoryItem(int id)async{
    await SearchHistoryDb().deleteOfDatabase(id);
    searchHistories= await SearchHistoryDb().getList();
    notifyListeners();
  }
  void insertSearchHistoryList(String title)async{
    HistorySearchModel model=HistorySearchModel(Random().nextInt(1000),title);
    await SearchHistoryDb().insertToDb(model);
    notifyListeners();
  }
  void searchingInProducts(String name){
    searchModel.clear();
    for(ProductInfoModel model in products){
      if(model.nameProduct.contains(name))
        searchModel.add(model);
    }
    notifyListeners();

  }

  void addProduct(Map<String, dynamic> json){
    products.add(
    ProductInfoModel(
        json["imageProduct"],
        json["nameProduct"],
        json["category"],
        json["status"],
        json["unit"],
        json["mostNumberProduct"],
        json["priceProduct"],
        json["descriptionProduct"],
        json["selectDay"],
        json["toTime"],
        json["fromTime"]
    )
    );
    notifyListeners();
  }

  void removedProduct(String name){
    for(int i=0;i<products.length;i++){
      if(products[i].nameProduct==name)
        products.removeAt(i);
    }
    notifyListeners();
  }


}