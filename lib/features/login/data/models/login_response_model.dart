class LoginResponseModel {
  final String? deliveryName;

  const LoginResponseModel({required this.deliveryName});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(deliveryName: json['DeliveryName']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DeliveryName'] = deliveryName;
    return data;
  }
}

