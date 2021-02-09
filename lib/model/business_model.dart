class BusinessModel {
  bool _premium;
  List<Data> _data;

  bool get premium => _premium;
  List<Data> get data => _data;

  BusinessModel({
      bool premium, 
      List<Data> data}){
    _premium = premium;
    _data = data;
}

  BusinessModel.fromJson(dynamic json) {
    _premium = json["premium"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["premium"] = _premium;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  int _id;
  String _companyName;
  String _address;
  String _ownerName;
  String _description;
  String _pincode;
  String _city;
  dynamic _state;
  List<String> _phones;
  List<Tags> _tags;
  List<Reviews> _reviews;

  int get id => _id;
  String get companyName => _companyName;
  String get address => _address;
  String get ownerName => _ownerName;
  String get description => _description;
  String get pincode => _pincode;
  String get city => _city;
  dynamic get state => _state;
  List<String> get phones => _phones;
  List<Tags> get tags => _tags;
  List<Reviews> get reviews => _reviews;

  Data({
      int id, 
      String companyName, 
      String address, 
      String ownerName, 
      String description, 
      String pincode, 
      String city, 
      dynamic state, 
      List<String> phones, 
      List<Tags> tags, 
      List<Reviews> reviews}){
    _id = id;
    _companyName = companyName;
    _address = address;
    _ownerName = ownerName;
    _description = description;
    _pincode = pincode;
    _city = city;
    _state = state;
    _phones = phones;
    _tags = tags;
    _reviews = reviews;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _companyName = json["company_name"];
    _address = json["address"];
    _ownerName = json["owner_name"];
    _description = json["description"];
    _pincode = json["pincode"];
    _city = json["city"];
    _state = json["state"];
    _phones = json["phones"] != null ? json["phones"].cast<String>() : [];
    if (json["tags"] != null) {
      _tags = [];
      json["tags"].forEach((v) {
        _tags.add(Tags.fromJson(v));
      });
    }
    if (json["reviews"] != null) {
      _reviews = [];
      json["reviews"].forEach((v) {
        _reviews.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["company_name"] = _companyName;
    map["address"] = _address;
    map["owner_name"] = _ownerName;
    map["description"] = _description;
    map["pincode"] = _pincode;
    map["city"] = _city;
    map["state"] = _state;
    map["phones"] = _phones;
    if (_tags != null) {
      map["tags"] = _tags.map((v) => v.toJson()).toList();
    }
    if (_reviews != null) {
      map["reviews"] = _reviews.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reviews {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Reviews({
      int id, 
      String name}){
    _id = id;
    _name = name;
}

  Reviews.fromJson(dynamic json) {
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

class Tags {
  int _id;
  String _name;

  int get id => _id;
  String get name => _name;

  Tags({
      int id, 
      String name}){
    _id = id;
    _name = name;
}

  Tags.fromJson(dynamic json) {
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