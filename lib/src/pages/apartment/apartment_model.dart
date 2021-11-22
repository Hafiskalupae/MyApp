import 'dart:convert';

ApartmentModel apartmentModelFromJson(String str) => ApartmentModel.fromJson(json.decode(str));

String apartmentModelToJson(ApartmentModel data) => json.encode(data.toJson());

class ApartmentModel {
  ApartmentModel({
    this.Apartments,
  });

  List<Apartment> Apartments;

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
    Apartments: List<Apartment>.from(json["Apartments"].map((x) => Apartment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Apartments": List<dynamic>.from(Apartments.map((x) => x.toJson())),
  };
}



class Apartment {
  Apartment({
    this.apmid,
    this.apmname,
    this.apmprice,
    this.apmlocation,
    this.apmphone,
    this.apmlimitedroom,
    this.apmfacilities,
    this.apmtype,
    this.apmdetail,
    this.apmimage

  });

  String apmid;
  String apmname;
  String apmprice;
  String apmlocation;
  String apmphone;
  String apmlimitedroom;
  String apmfacilities;
  String apmtype;
  String apmdetail;
  String apmimage;

  factory Apartment.fromJson(Map<String, dynamic> json) => Apartment(
    apmid: json["apm_id"],
    apmname: json["apm_name"],
    apmprice: json["apm_price"],
    apmlocation: json["apm_location"],
    apmphone: json["apm_phone"],
    apmlimitedroom: json["apm_limitedroom"],
    apmfacilities: json["apm_facilities"],
    apmtype: json["apm_type"],
    apmdetail: json["apm_detail"],
    apmimage: json["apm_image"],
  );

  Map<String, dynamic> toJson() => {
    "apm_id": apmid,
    "apm_name": apmname,
    "apm_price": apmprice,
    "apm_location": apmlocation,
    "apm_phone": apmphone,
    "apm_limitedroom": apmlimitedroom,
    "apm_facilities": apmfacilities,
    "apm_type": apmtype,
    "apm_detail": apmdetail,
    "apm_image" : apmimage,
  };
}