import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../utils/valueutils.dart';

class CustomMultiSelectedWidget extends StatefulWidget{

  final editDay;
  final bool checkEditor;

  CustomMultiSelectedWidget({this.editDay,required this.checkEditor});

  @override
  State<StatefulWidget> createState()=>CustomMultiSelectedWidgetState();

}

class CustomMultiSelectedWidgetState extends State<CustomMultiSelectedWidget>{

  late bool specialDay=false;
  final List<String> days=["شنبه","یک شنبه","دو شنبه","سه شنبه","چهار شنبه","پنج شنبه","جمعه",];
  final specialDayKey=GlobalKey<FormFieldState>();
  late var selectedValue='برای روز های خاص';

  void showMultiSelect()async{
    await showDialog(context: context, builder: (context){
      return MultiSelectDialog(
        confirmText: Text("تایید",style: TextStyle(color: Colors.green.shade800,fontSize: 15),),
        cancelText: Text("لغو",style: TextStyle(color: Colors.red.shade800,fontSize: 15),),
        listType: MultiSelectListType.LIST,
        initialValue: ValueUtility.selectedDay,
        items: days.map((day)=>MultiSelectItem<String>(day, day)).toList(),
        title: Text("انتخاب روز",style: TextStyle(color: Colors.grey.shade700),),
        selectedColor: Theme.of(context).primaryColor,
        searchable: true,
        selectedItemsTextStyle: TextStyle(color: Theme.of(context).primaryColor),
        onConfirm: (results){
          ValueUtility.selectedDay=results;
          selectedValue="";

          for(int i=0;i<ValueUtility.selectedDay.length;i++){
            setState(() {
              selectedValue+=ValueUtility.selectedDay[i]+" , ";
            });
          }
        },
      );
    });
  }

  @override
  void initState() {
    if(widget.checkEditor){
      print(widget.editDay.toString());
      if(widget.editDay.toString() != "[]"){
        specialDay=true;
        selectedValue="";
        ValueUtility.selectedDay=widget.editDay;
        for(int i=0;i<ValueUtility.selectedDay.length;i++){
          setState(() {
            selectedValue+=ValueUtility.selectedDay[i]+" , ";
          });
        }
      }else{
        specialDay=false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>Container(
    child: ListTile(
      onTap: (){
        setState(() {
          specialDay = !specialDay;
          if(specialDay){
            showMultiSelect();
          }else{
            selectedValue='برای روز های خاص';
          }
        });
      },
      title: Text(selectedValue.toString(),style: TextStyle(color: Colors.black,fontSize: 15),),
      trailing: Container(
        child: Switch(
            value: specialDay,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                specialDay = value;
                if(specialDay){
                  showMultiSelect();
                }else{
                  selectedValue='برای روز های خاص';
                }
              });
            }),
        margin: const EdgeInsets.only(left: 15),
      ),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
        ]
    ),
  );


}