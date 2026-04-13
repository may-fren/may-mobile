// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRoleResponseImpl _$$UserRoleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoleResponseImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      roleId: (json['roleId'] as num).toInt(),
      roleName: json['roleName'] as String,
    );

Map<String, dynamic> _$$UserRoleResponseImplToJson(
        _$UserRoleResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'roleName': instance.roleName,
    };

_$UserRoleRequestImpl _$$UserRoleRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRoleRequestImpl(
      userId: (json['userId'] as num).toInt(),
      roleId: (json['roleId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserRoleRequestImplToJson(
        _$UserRoleRequestImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'roleId': instance.roleId,
    };
