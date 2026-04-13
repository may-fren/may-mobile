// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleImpl _$$RoleImplFromJson(Map<String, dynamic> json) => _$RoleImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
      createdDate: json['createdDate'] as String,
      createdBy: json['createdBy'] as String,
    );

Map<String, dynamic> _$$RoleImplToJson(_$RoleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
    };

_$CreateRoleRequestImpl _$$CreateRoleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateRoleRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$CreateRoleRequestImplToJson(
        _$CreateRoleRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

_$UpdateRoleRequestImpl _$$UpdateRoleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateRoleRequestImpl(
      name: json['name'] as String,
      description: json['description'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$UpdateRoleRequestImplToJson(
        _$UpdateRoleRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
