// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceItemImpl _$$ServiceItemImplFromJson(Map<String, dynamic> json) =>
    _$ServiceItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      city: json['city'] as String?,
      town: json['town'] as String?,
      address: json['address'] as String?,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$ServiceItemImplToJson(_$ServiceItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'town': instance.town,
      'address': instance.address,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };

_$CreateServiceRequestImpl _$$CreateServiceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateServiceRequestImpl(
      name: json['name'] as String,
      city: json['city'] as String?,
      town: json['town'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$CreateServiceRequestImplToJson(
        _$CreateServiceRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'town': instance.town,
      'address': instance.address,
    };

_$UpdateServiceRequestImpl _$$UpdateServiceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateServiceRequestImpl(
      name: json['name'] as String,
      city: json['city'] as String?,
      town: json['town'] as String?,
      address: json['address'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdateServiceRequestImplToJson(
        _$UpdateServiceRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'town': instance.town,
      'address': instance.address,
      'status': instance.status,
    };
