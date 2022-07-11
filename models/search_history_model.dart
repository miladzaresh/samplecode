
class HistorySearchModel {
  final int id;
  final String title;

  HistorySearchModel(this.id, this.title);

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "title":title
    };
  }
  factory HistorySearchModel.fromJson(Map<String,dynamic> json){
    return HistorySearchModel(json["id"], json["title"]);
  }
}