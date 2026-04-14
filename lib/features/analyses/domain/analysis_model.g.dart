// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalysisImpl _$$AnalysisImplFromJson(Map<String, dynamic> json) =>
    _$AnalysisImpl(
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

Map<String, dynamic> _$$AnalysisImplToJson(_$AnalysisImpl instance) =>
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

_$CreateAnalysisRequestImpl _$$CreateAnalysisRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateAnalysisRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      moduleId: (json['moduleId'] as num).toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$CreateAnalysisRequestImplToJson(
        _$CreateAnalysisRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'note': instance.note,
    };

_$UpdateAnalysisRequestImpl _$$UpdateAnalysisRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateAnalysisRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      moduleId: (json['moduleId'] as num).toInt(),
      note: json['note'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdateAnalysisRequestImplToJson(
        _$UpdateAnalysisRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'moduleId': instance.moduleId,
      'note': instance.note,
      'status': instance.status,
    };
