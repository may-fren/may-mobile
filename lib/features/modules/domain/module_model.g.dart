// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleImpl _$$ModuleImplFromJson(Map<String, dynamic> json) => _$ModuleImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      code: json['code'] as String,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$ModuleImplToJson(_$ModuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'code': instance.code,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };

_$CreateModuleRequestImpl _$$CreateModuleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateModuleRequestImpl(
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      code: json['code'] as String,
    );

Map<String, dynamic> _$$CreateModuleRequestImplToJson(
        _$CreateModuleRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'code': instance.code,
    };

_$UpdateModuleRequestImpl _$$UpdateModuleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateModuleRequestImpl(
      name: json['name'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num?)?.toInt(),
      code: json['code'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdateModuleRequestImplToJson(
        _$UpdateModuleRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'code': instance.code,
      'status': instance.status,
    };
