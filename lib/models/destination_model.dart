// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DestinationModel {
  String address;
  String number;
  String city;
  String locality;
  String cep;
  double latitude;
  double longitude;

  DestinationModel({
    required this.address,
    required this.number,
    required this.city,
    required this.locality,
    required this.cep,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'number': number,
      'city': city,
      'locality': locality,
      'cep': cep,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory DestinationModel.fromMap(Map<String, dynamic> map) {
    return DestinationModel(
      address: map['address'] as String,
      number: map['number'] as String,
      city: map['city'] as String,
      locality: map['locality'] as String,
      cep: map['cep'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory DestinationModel.fromJson(String source) =>
      DestinationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
