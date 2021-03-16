class PaymentPackageModel {
  Data _data;

  Data get data => _data;

  PaymentPackageModel({
      Data data}){
    _data = data;
}

  PaymentPackageModel.fromJson(dynamic json) {
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

class Data {
  int _price;
  int _contactsOnPayment;

  int get price => _price;
  int get contactsOnPayment => _contactsOnPayment;

  Data({
      int price, 
      int contactsOnPayment}){
    _price = price;
    _contactsOnPayment = contactsOnPayment;
}

  Data.fromJson(dynamic json) {
    _price = json["price"];
    _contactsOnPayment = json["contacts_on_payment"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["price"] = _price;
    map["contacts_on_payment"] = _contactsOnPayment;
    return map;
  }

}