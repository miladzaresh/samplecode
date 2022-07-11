import 'package:flutter/material.dart';
import 'package:takfoodowner/models/product_info_model.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';
import 'package:takfoodowner/utils/valueutils.dart';
import 'package:provider/provider.dart';
import '../pages/edit_product.dart';

class ProductListItem extends StatefulWidget{

  final ProductInfoModel model;
  final context;

  ProductListItem({required this.context,required this.model});

  @override
  State<StatefulWidget> createState() =>ProductListItemState();


}
class ProductListItemState extends State<ProductListItem>{

  showAlarm() {
    final okBtn = TextButton(
      onPressed: () {
        context.read<OwnerProvider>().removedProduct(widget.model.nameProduct);
        Navigator.pop(context);
      },
      child: const Text(
        "بله",style: TextStyle(color: Colors.green),
      ),
    );
    final cancelBtn = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        "خیر",style: TextStyle(color: Colors.red),
      ),
    );
    AlertDialog alert = AlertDialog(
      content: Text("آیا میخواهید محصول ${widget.model.nameProduct} را حذف کنید؟"),
      actions: [cancelBtn,okBtn],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
  Future<void> handleSelected(String value)async{
    print(value);
    switch(value){
      case "ویرایش":
        await Navigator.of(context).push(PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) =>
          EditProduct(widget.model),
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
        break;
      case "ناموجود":
        break;
      case "حذف":
        showAlarm();
        break;

    }
  }
  @override
  Widget build(BuildContext context) =>Container(
    margin: EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
        ]),
    child: ListTile(
      title:Text(widget.model.nameProduct),
      subtitle: Text(widget.model.descriptionProduct),
      leading: Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade300),
            image: DecorationImage(image: AssetImage(widget.model.imageProduct), fit: BoxFit.cover)),
      ),
      trailing: PopupMenuButton<String>(
        onSelected: handleSelected,
        itemBuilder:(context){
          return {"ویرایش","ناموجود","حذف"}.map((e) {
            return PopupMenuItem<String>(child: Text(e,style: TextStyle(color: Colors.grey.shade800,fontSize: ValueUtility.titleNormalSze),),value: e,);
          }).toList();
        },
      ),
    ),
  );
}