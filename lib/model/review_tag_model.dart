import 'package:get/get.dart';
class ReviewTagModel {
  List<Data> _data;

  List<Data> get data => _data;

  ReviewTagModel({
      List<Data> data}){
    _data = data;
}

  ReviewTagModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  int _id;
  String _name;
  var _isSelected = 0.obs;

  int get id => _id;
  String get name => _name;
  int get  isSelected => _isSelected.value;


  set isSelected(value) {
    _isSelected.value = value;
  }
  Data({
      int id, 
      String name,
      var isSelected,
  }){
    _id = id;
    _name = name;
    _isSelected = isSelected;

  }

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }

}