import 'dart:math';

import 'package:flutter/material.dart';
import 'package:takfoodowner/componet/product_list_iem.dart';
import 'package:provider/provider.dart';
import 'package:takfoodowner/models/search_history_model.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SearchPageState();

}

class SearchPageState extends State<SearchPage>{
  final searchEditingController=TextEditingController();

  showHistorySearch(HistorySearchModel model){
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              searchEditingController.text=model.title;
              context.read<OwnerProvider>().searchingInProducts(searchEditingController.text);

            });
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          title: Text(model.title,style: TextStyle(color: Colors.grey.shade400,fontSize: 15),),
          leading: Icon(Icons.history,size: 20,color: Colors.grey.shade400,),
          trailing: IconButton(
            icon: Icon(Icons.close,size: 20,color: Colors.grey.shade400,),
            onPressed: (){
              context.read<OwnerProvider>().deleteSearchHistoryItem(model.id);
            },
          ),
        ),
        Divider(height: 0.5,color: Colors.grey.shade300,)
      ],
    );
  }
  @override
  void initState() {
    super.initState();
    context.read<OwnerProvider>().searchModel.clear();
    context.read<OwnerProvider>().getSearchHistoryList();
    print("testing search edittext is ${searchEditingController.text}");
    print("random integer is ${Random().nextInt(10)}");

  }
  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,size: 24,color: Colors.black,),
        onPressed: ()=>Navigator.pop(context),
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    TextField(
                      maxLines: 1,
                      controller: searchEditingController,
                      decoration: InputDecoration(
                          hintText: "جست و جو در محصولات",
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search,size: 24,color: Colors.grey.shade500,),
                            onPressed: (){
                              setState(() {
                                if(searchEditingController.text!=""){
                                  context.read<OwnerProvider>().insertSearchHistoryList(searchEditingController.text);
                                  context.read<OwnerProvider>().searchingInProducts(searchEditingController.text);
                                }else{
                                  context.read<OwnerProvider>().getSearchHistoryList();

                                }
                              });
                            },
                          ),
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300,width: 1),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade300,width: 1),
                              borderRadius: BorderRadius.circular(5)
                          )
                      ),
                    )
                  ]
              ),
            )
          ];
        },
        body: Padding(
          child: ListView.builder(
            itemCount: searchEditingController.text==""?context.watch<OwnerProvider>().searchHistories.length:context.watch<OwnerProvider>().searchModel.length,
            itemBuilder: (context,index)=>searchEditingController.text==""?showHistorySearch(context.watch<OwnerProvider>().searchHistories[index]):ProductListItem(context: context,model: context.watch<OwnerProvider>().searchModel[index],),
          ),
          padding: EdgeInsets.only(top: 15),
        ),
      ),
    ),
  );

}