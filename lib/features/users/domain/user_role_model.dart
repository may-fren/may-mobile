import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model.freezed.dart';
part 'user_role_model.g.dart';

@freezed
class UserRoleResponse with _$UserRoleResponse {
  const factory UserRoleResponse({
    required int id,
    required int userId,
    required int roleId,
    required String roleName,
  }) = _UserRoleResponse;

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);
}

@freezed
class UserRoleRequest with _$UserRoleRequest {
  const factory UserRoleRequest({
    required int userId,
    required int roleId,
  }) = _UserRoleRequest;

  factory UserRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRoleRequestFromJson(json);
}
