import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    required int id,
    required String name,
    String? description,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

@freezed
class CreateRoleRequest with _$CreateRoleRequest {
  const factory CreateRoleRequest({
    required String name,
    String? description,
  }) = _CreateRoleRequest;

  factory CreateRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateRoleRequestFromJson(json);
}

@freezed
class UpdateRoleRequest with _$UpdateRoleRequest {
  const factory UpdateRoleRequest({
    required String name,
    String? description,
    required String status,
  }) = _UpdateRoleRequest;

  factory UpdateRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoleRequestFromJson(json);
}
