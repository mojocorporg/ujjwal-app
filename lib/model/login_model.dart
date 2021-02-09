class LoginModel {
  String _token;
  bool _status;
  String _message;
  String _referralCode;
  int _userId;

  String get token => _token;
  bool get status => _status;
  String get message => _message;
  String get referralCode => _referralCode;
  int get userId => _userId;

  LoginModel({
      String token, 
      bool status, 
      String message, 
      String referralCode,
      int userId}){
    _token = token;
    _status = status;
    _message = message;
    _userId = userId;
    _referralCode = referralCode;
}

  LoginModel.fromJson(dynamic json) {
    _token = json["token"];
    _status = json["status"];
    _message = json["message"];
    _userId = json["user_id"];
    _referralCode = json["referral_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = _token;
    map["status"] = _status;
    map["message"] = _message;
    map["user_id"] = _userId;
    map["referral_code"] = _referralCode;
    return map;
  }

}