import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@freezed
class Permission with _$Permission {
  const factory Permission({
    required int id,
    required String name,
    String? description,
    String? module,
    String? action,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}

@freezed
class CreatePermissionRequest with _$CreatePermissionRequest {
  const factory CreatePermissionRequest({
    required String name,
    String? description,
    String? module,
    String? action,
  }) = _CreatePermissionRequest;

  factory CreatePermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreatePermissionRequestFromJson(json);
}

@freezed
class UpdatePermissionRequest with _$UpdatePermissionRequest {
  const factory UpdatePermissionRequest({
    required String name,
    String? description,
    String? module,
    String? action,
    required String status,
  }) = _UpdatePermissionRequest;

  factory UpdatePermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdatePermissionRequestFromJson(json);
}
