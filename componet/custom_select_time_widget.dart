import 'package:flutter/material.dart';
import 'package:takfoodowner/utils/valueutils.dart';
import 'package:provider/provider.dart';

class CustomSelectTimeWidget extends StatefulWidget{
  final toSelectedTime;
  final fromSelectedTime;


  CustomSelectTimeWidget({this.toSelectedTime, this.fromSelectedTime});

  @override
  State<StatefulWidget> createState() =>CustomSelectTimeWidgetState();
}

class CustomSelectTimeWidgetState extends State<CustomSelectTimeWidget>{

  late bool specialTime=false;
  late String toSelectedTime="از ساعت";
  late String fromSelectedTime="تا ساعت";
  late String selectedValue="برای ساعت خاص";
  late TimeOfDay? fromTime;
  late TimeOfDay? toTime;

  Future<void> selectToTime(context)async{
    toTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(toTime != null){
      setState(() {
        toSelectedTime="از  "+toTime!.hour.toString()+":"+toTime!.minute.toString();
        ValueUtility.toTimeSelected = toTime!.hour.toString() + ":" + toTime!.minute.toString();

      });
    }
  }

  Future<void> selectFromTime(context)async{
    fromTime=await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if(fromTime != null){
      setState(() {
        fromSelectedTime="تا  "+fromTime!.hour.toString()+":"+fromTime!.minute.toString();
        ValueUtility.fromTimeSelected = fromTime!.hour.toString() + ":" + fromTime!.minute.toString();
      });
    }
  }


  showTimeSelected(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8)
          )
        ),
        height: MediaQuery.of(context).size.height*0.22,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
                    ],
                  ),
                  child: TextButton(
                    onPressed: (){
                      selectToTime(context);
                    },
                    child: Text(toSelectedTime,style: TextStyle(color: Colors.black,fontSize: 15),),
                  ),
                )),
                SizedBox(width: 15,),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
                    ],
                  ),
                  child: TextButton(
                    onPressed: (){
                      selectFromTime(context);
                    },
                    child: Text(fromSelectedTime,style: TextStyle(color: Colors.black,fontSize: 15),),
                  ),
                )),
              ],
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  selectedValue=toSelectedTime+" "+fromSelectedTime;
                  Navigator.pop(context);
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Text("تایید",style: TextStyle(color: Colors.white,fontSize: 15),),
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    specialTime=widget.toSelectedTime==null||widget.toSelectedTime==""?false:true;
    if(widget.toSelectedTime != null){
      toSelectedTime="از "+widget.toSelectedTime;
      fromSelectedTime="تا  "+widget.fromSelectedTime;

    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) =>Container(
    child: ListTile(
      onTap: (){
        setState(() {
          specialTime = !specialTime;
          // if(specialTime){
          //   showTimeSelected();
          // }else{
          //   selectedValue='برای ساعت خاص';
          //   toSelectedTime="از ساعت";
          //   fromSelectedTime="تا ساعت";
          // }
        });
      },
      subtitle: Visibility(
        child: Padding(
          child: Row(
            children: [
              Expanded(child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
                  ],
                ),
                child: TextButton(
                  onPressed: (){
                    selectToTime(context);
                  },
                  child: Text(toSelectedTime,style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              )),
              SizedBox(width: 15,),
              Expanded(child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade100, blurRadius: 3, spreadRadius: 1, offset: const Offset(0.1, 0.5))
                  ],
                ),
                child: TextButton(
                  onPressed: (){
                    selectFromTime(context);
                  },
                  child: Text(fromSelectedTime,style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              )),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        visible: specialTime,
      ),
      title: Text(selectedValue.toString(),style: TextStyle(color: Colors.black,fontSize: 15),),
      trailing: Container(
        child: Switch(
            value: specialTime,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                specialTime = value;
                if(specialTime){
                  showTimeSelected();
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