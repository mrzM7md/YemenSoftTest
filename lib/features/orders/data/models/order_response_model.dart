import 'package:equatable/equatable.dart';

class OrderResponseModel extends Equatable {
  final String? bILLTYPE;
  final String? bILLDATE;
  final String? bILLAMT;
  final String? bDLVRYTATUSFLG;
  final String? bILLNO;
  final String? bILLSRL;

  const OrderResponseModel(
      {
        required this.bILLTYPE,
        required this.bILLDATE,
        required this.bILLAMT,
        required this.bDLVRYTATUSFLG,
        required this.bILLNO,
        required this.bILLSRL,
      });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
          bILLTYPE: json['BILL_TYPE'],
          bILLDATE: json['BILL_DATE'],
          bILLAMT: json['BILL_AMT'],
          bDLVRYTATUSFLG: json['DLVRY_STATUS_FLG'],
          bILLSRL: json['BILL_SRL'],
          bILLNO: json['BILL_NO'],
      );

  Map<String, dynamic> toJson() => {
    'BILL_TYPE': bILLTYPE,
    'BILL_DATE': bILLDATE,
    'BILL_AMT': bILLAMT,
    "DLVRY_STATUS_FLG": bDLVRYTATUSFLG,
    "BILL_SRL": bILLSRL,
  };

  @override
  List<Object?> get props => [
    bILLTYPE,
    bILLDATE,
    bILLAMT,
    bDLVRYTATUSFLG,
    bILLNO,
    bILLSRL
  ];
}
