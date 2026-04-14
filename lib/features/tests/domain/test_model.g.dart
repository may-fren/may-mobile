// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestItemImpl _$$TestItemImplFromJson(Map<String, dynamic> json) =>
    _$TestItemImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      moduleId: (json['moduleId'] as num).toInt(),
      moduleName: json['moduleName'] as String,
      note: json['note'] as String?,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$TestItemImplToJson(_$TestItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'moduleName': instance.moduleName,
      'note': instance.note,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };

_$CreateTestRequestImpl _$$CreateTestRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateTestRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      moduleId: (json['moduleId'] as num).toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateTestRequestImplToJson(
        _$CreateTestRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'note': instance.note,
    };

_$UpdateTestRequestImpl _$$UpdateTestRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateTestRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      moduleId: (json['moduleId'] as num).toInt(),
      note: json['note'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdateTestRequestImplToJson(
        _$UpdateTestRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'note': instance.note,
      'status': instance.status,
    };
