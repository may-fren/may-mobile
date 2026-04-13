// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RolePermissionResponseImpl _$$RolePermissionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RolePermissionResponseImpl(
      id: (json['id'] as num).toInt(),
      roleId: (json['roleId'] as num).toInt(),
      permissionId: (json['permissionId'] as num).toInt(),
      permissionName: json['permissionName'] as String,
    );

Map<String, dynamic> _$$RolePermissionResponseImplToJson(
        _$RolePermissionResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleId': instance.roleId,
      'permissionId': instance.permissionId,
      'permissionName': instance.permissionName,
    };

_$RolePermissionRequestImpl _$$RolePermissionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RolePermissionRequestImpl(
      roleId: (json['roleId'] as num).toInt(),
      permissionId: (json['permissionId'] as num).toInt(),
    );

Map<String, dynamic> _$$RolePermissionRequestImplToJson(
        _$RolePermissionRequestImpl instance) =>
    <String, dynamic>{
      'roleId': instance.roleId,
      'permissionId': instance.permissionId,
    };
