// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RolePermissionResponse _$RolePermissionResponseFromJson(
    Map<String, dynamic> json) {
  return _RolePermissionResponse.fromJson(json);
}

/// @nodoc
mixin _$RolePermissionResponse {
  int get id => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;
  int get permissionId => throw _privateConstructorUsedError;
  String get permissionName => throw _privateConstructorUsedError;

  /// Serializes this RolePermissionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RolePermissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RolePermissionResponseCopyWith<RolePermissionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolePermissionResponseCopyWith<$Res> {
  factory $RolePermissionResponseCopyWith(RolePermissionResponse value,
          $Res Function(RolePermissionResponse) then) =
      _$RolePermissionResponseCopyWithImpl<$Res, RolePermissionResponse>;
  @useResult
  $Res call({int id, int roleId, int permissionId, String permissionName});
}

/// @nodoc
class _$RolePermissionResponseCopyWithImpl<$Res,
        $Val extends RolePermissionResponse>
    implements $RolePermissionResponseCopyWith<$Res> {
  _$RolePermissionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RolePermissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleId = null,
    Object? permissionId = null,
    Object? permissionName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionName: null == permissionName
          ? _value.permissionName
          : permissionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolePermissionResponseImplCopyWith<$Res>
    implements $RolePermissionResponseCopyWith<$Res> {
  factory _$$RolePermissionResponseImplCopyWith(
          _$RolePermissionResponseImpl value,
          $Res Function(_$RolePermissionResponseImpl) then) =
      __$$RolePermissionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int roleId, int permissionId, String permissionName});
}

/// @nodoc
class __$$RolePermissionResponseImplCopyWithImpl<$Res>
    extends _$RolePermissionResponseCopyWithImpl<$Res,
        _$RolePermissionResponseImpl>
    implements _$$RolePermissionResponseImplCopyWith<$Res> {
  __$$RolePermissionResponseImplCopyWithImpl(
      _$RolePermissionResponseImpl _value,
      $Res Function(_$RolePermissionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RolePermissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roleId = null,
    Object? permissionId = null,
    Object? permissionName = null,
  }) {
    return _then(_$RolePermissionResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionName: null == permissionName
          ? _value.permissionName
          : permissionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolePermissionResponseImpl implements _RolePermissionResponse {
  const _$RolePermissionResponseImpl(
      {required this.id,
      required this.roleId,
      required this.permissionId,
      required this.permissionName});

  factory _$RolePermissionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolePermissionResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int roleId;
  @override
  final int permissionId;
  @override
  final String permissionName;

  @override
  String toString() {
    return 'RolePermissionResponse(id: $id, roleId: $roleId, permissionId: $permissionId, permissionName: $permissionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolePermissionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.permissionId, permissionId) ||
                other.permissionId == permissionId) &&
            (identical(other.permissionName, permissionName) ||
                other.permissionName == permissionName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, roleId, permissionId, permissionName);

  /// Create a copy of RolePermissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RolePermissionResponseImplCopyWith<_$RolePermissionResponseImpl>
      get copyWith => __$$RolePermissionResponseImplCopyWithImpl<
          _$RolePermissionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolePermissionResponseImplToJson(
      this,
    );
  }
}

abstract class _RolePermissionResponse implements RolePermissionResponse {
  const factory _RolePermissionResponse(
      {required final int id,
      required final int roleId,
      required final int permissionId,
      required final String permissionName}) = _$RolePermissionResponseImpl;

  factory _RolePermissionResponse.fromJson(Map<String, dynamic> json) =
      _$RolePermissionResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get roleId;
  @override
  int get permissionId;
  @override
  String get permissionName;

  /// Create a copy of RolePermissionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RolePermissionResponseImplCopyWith<_$RolePermissionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RolePermissionRequest _$RolePermissionRequestFromJson(
    Map<String, dynamic> json) {
  return _RolePermissionRequest.fromJson(json);
}

/// @nodoc
mixin _$RolePermissionRequest {
  int get roleId => throw _privateConstructorUsedError;
  int get permissionId => throw _privateConstructorUsedError;

  /// Serializes this RolePermissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RolePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RolePermissionRequestCopyWith<RolePermissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolePermissionRequestCopyWith<$Res> {
  factory $RolePermissionRequestCopyWith(RolePermissionRequest value,
          $Res Function(RolePermissionRequest) then) =
      _$RolePermissionRequestCopyWithImpl<$Res, RolePermissionRequest>;
  @useResult
  $Res call({int roleId, int permissionId});
}

/// @nodoc
class _$RolePermissionRequestCopyWithImpl<$Res,
        $Val extends RolePermissionRequest>
    implements $RolePermissionRequestCopyWith<$Res> {
  _$RolePermissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RolePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? permissionId = null,
  }) {
    return _then(_value.copyWith(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolePermissionRequestImplCopyWith<$Res>
    implements $RolePermissionRequestCopyWith<$Res> {
  factory _$$RolePermissionRequestImplCopyWith(
          _$RolePermissionRequestImpl value,
          $Res Function(_$RolePermissionRequestImpl) then) =
      __$$RolePermissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int roleId, int permissionId});
}

/// @nodoc
class __$$RolePermissionRequestImplCopyWithImpl<$Res>
    extends _$RolePermissionRequestCopyWithImpl<$Res,
        _$RolePermissionRequestImpl>
    implements _$$RolePermissionRequestImplCopyWith<$Res> {
  __$$RolePermissionRequestImplCopyWithImpl(_$RolePermissionRequestImpl _value,
      $Res Function(_$RolePermissionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RolePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? permissionId = null,
  }) {
    return _then(_$RolePermissionRequestImpl(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolePermissionRequestImpl implements _RolePermissionRequest {
  const _$RolePermissionRequestImpl(
      {required this.roleId, required this.permissionId});

  factory _$RolePermissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolePermissionRequestImplFromJson(json);

  @override
  final int roleId;
  @override
  final int permissionId;

  @override
  String toString() {
    return 'RolePermissionRequest(roleId: $roleId, permissionId: $permissionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolePermissionRequestImpl &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.permissionId, permissionId) ||
                other.permissionId == permissionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roleId, permissionId);

  /// Create a copy of RolePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RolePermissionRequestImplCopyWith<_$RolePermissionRequestImpl>
      get copyWith => __$$RolePermissionRequestImplCopyWithImpl<
          _$RolePermissionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolePermissionRequestImplToJson(
      this,
    );
  }
}

abstract class _RolePermissionRequest implements RolePermissionRequest {
  const factory _RolePermissionRequest(
      {required final int roleId,
      required final int permissionId}) = _$RolePermissionRequestImpl;

  factory _RolePermissionRequest.fromJson(Map<String, dynamic> json) =
      _$RolePermissionRequestImpl.fromJson;

  @override
  int get roleId;
  @override
  int get permissionId;

  /// Create a copy of RolePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RolePermissionRequestImplCopyWith<_$RolePermissionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
