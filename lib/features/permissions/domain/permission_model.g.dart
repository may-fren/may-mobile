// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionImpl _$$PermissionImplFromJson(Map<String, dynamic> json) =>
    _$PermissionImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      module: json['module'] as String?,
      action: json['action'] as String?,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$PermissionImplToJson(_$PermissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'module': instance.module,
      'action': instance.action,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };

_$CreatePermissionRequestImpl _$$CreatePermissionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreatePermissionRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      module: json['module'] as String?,
      action: json['action'] as String?,
    );

Map<String, dynamic> _$$CreatePermissionRequestImplToJson(
        _$CreatePermissionRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'module': instance.module,
      'action': instance.action,
    };

_$UpdatePermissionRequestImpl _$$UpdatePermissionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdatePermissionRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      module: json['module'] as String?,
      action: json['action'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdatePermissionRequestImplToJson(
        _$UpdatePermissionRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'module': instance.module,
      'action': instance.action,
      'status': instance.status,
    };
