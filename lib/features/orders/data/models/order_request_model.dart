class OrderRequestModel {
  final String? pDLVRYNO;
  final String? pLANGNO;

  const OrderRequestModel({required this.pDLVRYNO, required this.pLANGNO});

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>OrderRequestModel(
    pDLVRYNO: json['P_DLVRY_NO'],
    pLANGNO: json['P_LANG_NO']
  );

  Map<String, dynamic> toJson() => {
    "Value":{
          'P_DLVRY_NO': pDLVRYNO,
          'P_LANG_NO': pLANGNO,
        }
      };
}
