class ReturnModel {
  bool _status;
  String _message;

  bool get status => _status;
  String get message => _message;

  ReturnModel({
      bool status, 
      String message}){
    _status = status;
    _message = message;
}

  ReturnModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    return map;
  }

}