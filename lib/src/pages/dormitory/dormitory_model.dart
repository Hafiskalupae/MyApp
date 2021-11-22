import 'dart:convert';

DormitoryModel DormitoryModelFromJson(String str) => DormitoryModel.fromJson(json.decode(str));

String DormitoryModelToJson(DormitoryModel data) => json.encode(data.toJson());

class DormitoryModel {
  DormitoryModel({
    this.Dormitorys,
  });

  List<Dormitory> Dormitorys;

  factory DormitoryModel.fromJson(Map<String, dynamic> json) => DormitoryModel(
    Dormitorys: List<Dormitory>.from(json["Apartments"].map((x) => Dormitory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Apartments": List<dynamic>.from(Dormitorys.map((x) => x.toJson())),
  };
}



class Dormitory {
  Dormitory({
    this.dmId,
    this.dmName,
    this.dmPrice,
    this.dmLocation,
    this.dmPhone,
    this.dmLimitedroom,
    this.dmFacilities,
    this.dmType,
    this.dmDetail,
    this.dmimage

  });

  String dmId;
  String dmName;
  String dmPrice;
  String dmLocation;
  String dmPhone;
  String dmLimitedroom;
  String dmFacilities;
  String dmType;
  String dmDetail;
  String dmimage;

  factory Dormitory.fromJson(Map<String, dynamic> json) => Dormitory(
    dmId: json["apm_id"],
    dmName: json["apm_name"],
    dmPrice: json["apm_price"],
    dmLocation: json["apm_location"],
    dmPhone: json["apm_phone"],
    dmLimitedroom: json["apm_limitedroom"],
    dmFacilities: json["apm_facilities"],
    dmType: json["apm_type"],
    dmDetail: json["apm_detail"],
    dmimage: json["apm_image"],
  );

  Map<String, dynamic> toJson() => {
    "apm_id": dmId,
    "apm_name": dmName,
    "apm_price": dmPrice,
    "apm_location": dmLocation,
    "apm_phone": dmPhone,
    "apm_limitedroom": dmLimitedroom,
    "apm_facilities": dmFacilities,
    "apm_type": dmType,
    "apm_detail": dmDetail,
    "apm_image" : dmimage,
  };
}