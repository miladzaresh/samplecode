

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:takfoodowner/componet/add_photo_store_widget.dart';
import 'package:takfoodowner/componet/custom_dropdown_widget.dart';
import 'package:takfoodowner/componet/custom_textfiel_widget.dart';
import 'package:takfoodowner/providercontroller/owner_provider.dart';
import 'package:takfoodowner/utils/valueutils.dart';
import 'package:provider/provider.dart';

import '../componet/custom_multiselect_widget.dart';
import '../componet/custom_select_time_widget.dart';

class AddProductPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>AddProductPageState();
}
class AddProductPageState extends State<AddProductPage>{

  final scaffoldKey=GlobalKey<ScaffoldState>();
  late String selectCategory="انتخاب";
  late String selectStatus="انتخاب";
  late String selectUnit="انتخاب";
  late String imageProduct="assets/images/benana.png";
  final TextEditingController nameProductController = TextEditingController();
  final TextEditingController numberProductController = TextEditingController();
  final TextEditingController priceProductController = TextEditingController();
  final TextEditingController descriptionProductController = TextEditingController();
  late List<String> categories=[
    "میوه",
    "پوشاک",
    "کفش",
  ];
  late List<String> statuses=[
    "موجود",
    "اتمام",
  ];
  late List<String> units=[
    "عدد",
    "بسته",
    "کیلو",
  ];

   onCategoryChanged(String value){
    setState(() {
      selectCategory=value;
      Navigator.pop(context);
    });
  }
   onStatusChanged(String value){
    setState(() {
      selectStatus=value;
      Navigator.pop(context);
    });
  }
   onUnitChanged(String value){
    setState(() {
      selectUnit=value;
      Navigator.pop(context);
    });

  }


  @override
  void initState() {
    ValueUtility.selectedDay.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) =>Scaffold(
    key: scaffoldKey,
    appBar: AppBar(
      title: Text("افزودن محصول",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.black45,
      actions: [
        Container(
          child: IconButton(
            icon: Icon(Icons.check_outlined,size: 24,color: Colors.white,),
            onPressed: () {
              var result={

                "nameProduct":nameProductController.text,
                "mostNumberProduct":numberProductController.text,
                "toTime":ValueUtility.toTimeSelected,
                "fromTime":ValueUtility.fromTimeSelected,
                "selectDay":ValueUtility.selectedDay,
                "priceProduct":priceProductController.text,
                "descriptionProduct":descriptionProductController.text,
                "category":selectCategory=="انتخاب"?"":selectCategory,
                "unit":selectUnit=="انتخاب"?"":selectUnit,
                "status":selectStatus=="انتخاب"?"":selectStatus,
                "imageProduct":imageProduct
              };
              ValueUtility.toTimeSelected="";
              ValueUtility.fromTimeSelected="";
              print(json.encode(result));

              context.read<OwnerProvider>().addProduct(result);
              Navigator.pop(context);


            },
          ),
        )
      ],
      leading: Container(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp,size: 24,color: Colors.white ,),
          onPressed: () =>Navigator.pop(context),
        ),
      ),
    ),
    body: SafeArea(
      child:SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              AddPhotoStoreWidget(imageProduct),
              SizedBox(height: 35,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    CustomTextFieldWidget(controller: nameProductController,label: "نام محصول",type: TextInputType.text,maxLines: 1,),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropdownWidget(label: "دسته بندی",onChanged: onCategoryChanged,selectValue: selectCategory,context: context,items: categories,),
                        SizedBox(width: 15,),
                        CustomDropdownWidget(label: "وضعیت",onChanged: onStatusChanged,selectValue: selectStatus,context: context,items: statuses,),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropdownWidget(label: "واحد",onChanged: onUnitChanged,selectValue: selectUnit,context: context,items: units,),
                        SizedBox(width: 15,),
                        Expanded(child: CustomTextFieldWidget(controller: numberProductController,label: "حداکثر(تعداد)",type: TextInputType.number,maxLines: 1,)),
                      ],
                    ),
                    SizedBox(height: 25,),
                    CustomTextFieldWidget(controller: priceProductController,label: "قیمت",type: TextInputType.number,maxLines: 1,),
                    SizedBox(height: 25,),
                    CustomTextFieldWidget(controller:descriptionProductController,label: "توضیحات",type: TextInputType.text,maxLines: 5,),
                    SizedBox(height: 25,),
                    CustomMultiSelectedWidget(checkEditor: false,),
                    SizedBox(height: 25,),
                    CustomSelectTimeWidget(),
                    SizedBox(height: 25,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );

}