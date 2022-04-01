class Order {
  Map<String, String> data;
  String userID;
  String code;

  Order(
      {required this.userID,
      required this.data,
      required this.code,
      });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        code: json["code"],
        userID: json["userID"],
        data: json["data"]);
  }
}
