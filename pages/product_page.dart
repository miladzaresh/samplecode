import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takfoodowner/componet/product_list_iem.dart';
import 'package:takfoodowner/componet/search_widget.dart';
import 'package:takfoodowner/pages/add_product_page.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';

import 'search_page.dart';
import 'edit_product.dart';
class ProductPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>ProductPageState();

}
class ProductPageState extends State<ProductPage>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    SearchWidget(),
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("محصولات",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade300, width: 1),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
                                ]
                            ),
                            child: IconButton(
                                iconSize: 24,
                                padding: EdgeInsets.zero,
                                onPressed: ()async{
                                  await Navigator.of(context).push(PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 400),
                                    pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) =>
                                     AddProductPage(),
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
                                icon: Icon(Icons.add,color: Colors.grey.shade700,)
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,)
                  ],
                )
              ]),
            ),
          ];
        },
        body: ListView.builder(itemBuilder: (context, index) => ProductListItem(context: context,model: context.watch<OwnerProvider>().products[index],),itemCount: context.watch<OwnerProvider>().products.length,));
  }

}