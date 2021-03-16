class OrderResponseModel {
  bool _status;
  String _message;
  String _razorpayOrderId;
  int _price;

  bool get status => _status;
  String get message => _message;
  String get razorpayOrderId => _razorpayOrderId;
  int get price => _price;

  OrderResponseModel({
      bool status, 
      String message, 
      String razorpayOrderId, 
      int price}){
    _status = status;
    _message = message;
    _razorpayOrderId = razorpayOrderId;
    _price = price;
}

  OrderResponseModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _razorpayOrderId = json["razorpay_order_id"];
    _price = json["price"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    map["razorpay_order_id"] = _razorpayOrderId;
    map["price"] = _price;
    return map;
  }

}