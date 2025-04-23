class UserLoginModel {
  final String? langNo;
  final String? deliveryNo;
  final String? password;

  const UserLoginModel({required this.langNo, required this.deliveryNo, required this.password});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
        langNo: json['P_LANG_NO'],
        deliveryNo: json['P_DLVRY_NO'],
        password: json['P_PSSWRD']
    );
  }

  Map<String, dynamic> toJson() => {
    "Value":{
      'P_LANG_NO' : langNo,
      'P_DLVRY_NO' : deliveryNo,
      'P_PSSWRD' : password,
    }
  };
}
