// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRoleResponse _$UserRoleResponseFromJson(Map<String, dynamic> json) {
  return _UserRoleResponse.fromJson(json);
}

/// @nodoc
mixin _$UserRoleResponse {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;
  String get roleName => throw _privateConstructorUsedError;

  /// Serializes this UserRoleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleResponseCopyWith<UserRoleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleResponseCopyWith<$Res> {
  factory $UserRoleResponseCopyWith(
          UserRoleResponse value, $Res Function(UserRoleResponse) then) =
      _$UserRoleResponseCopyWithImpl<$Res, UserRoleResponse>;
  @useResult
  $Res call({int id, int userId, int roleId, String roleName});
}

/// @nodoc
class _$UserRoleResponseCopyWithImpl<$Res, $Val extends UserRoleResponse>
    implements $UserRoleResponseCopyWith<$Res> {
  _$UserRoleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? roleId = null,
    Object? roleName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleResponseImplCopyWith<$Res>
    implements $UserRoleResponseCopyWith<$Res> {
  factory _$$UserRoleResponseImplCopyWith(_$UserRoleResponseImpl value,
          $Res Function(_$UserRoleResponseImpl) then) =
      __$$UserRoleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int userId, int roleId, String roleName});
}

/// @nodoc
class __$$UserRoleResponseImplCopyWithImpl<$Res>
    extends _$UserRoleResponseCopyWithImpl<$Res, _$UserRoleResponseImpl>
    implements _$$UserRoleResponseImplCopyWith<$Res> {
  __$$UserRoleResponseImplCopyWithImpl(_$UserRoleResponseImpl _value,
      $Res Function(_$UserRoleResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? roleId = null,
    Object? roleName = null,
  }) {
    return _then(_$UserRoleResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      roleName: null == roleName
          ? _value.roleName
          : roleName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleResponseImpl implements _UserRoleResponse {
  const _$UserRoleResponseImpl(
      {required this.id,
      required this.userId,
      required this.roleId,
      required this.roleName});

  factory _$UserRoleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleResponseImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int roleId;
  @override
  final String roleName;

  @override
  String toString() {
    return 'UserRoleResponse(id: $id, userId: $userId, roleId: $roleId, roleName: $roleName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.roleName, roleName) ||
                other.roleName == roleName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, roleId, roleName);

  /// Create a copy of UserRoleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleResponseImplCopyWith<_$UserRoleResponseImpl> get copyWith =>
      __$$UserRoleResponseImplCopyWithImpl<_$UserRoleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleResponseImplToJson(
      this,
    );
  }
}

abstract class _UserRoleResponse implements UserRoleResponse {
  const factory _UserRoleResponse(
      {required final int id,
      required final int userId,
      required final int roleId,
      required final String roleName}) = _$UserRoleResponseImpl;

  factory _UserRoleResponse.fromJson(Map<String, dynamic> json) =
      _$UserRoleResponseImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get roleId;
  @override
  String get roleName;

  /// Create a copy of UserRoleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleResponseImplCopyWith<_$UserRoleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRoleRequest _$UserRoleRequestFromJson(Map<String, dynamic> json) {
  return _UserRoleRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRoleRequest {
  int get userId => throw _privateConstructorUsedError;
  int get roleId => throw _privateConstructorUsedError;

  /// Serializes this UserRoleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRoleRequestCopyWith<UserRoleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleRequestCopyWith<$Res> {
  factory $UserRoleRequestCopyWith(
          UserRoleRequest value, $Res Function(UserRoleRequest) then) =
      _$UserRoleRequestCopyWithImpl<$Res, UserRoleRequest>;
  @useResult
  $Res call({int userId, int roleId});
}

/// @nodoc
class _$UserRoleRequestCopyWithImpl<$Res, $Val extends UserRoleRequest>
    implements $UserRoleRequestCopyWith<$Res> {
  _$UserRoleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRoleRequestImplCopyWith<$Res>
    implements $UserRoleRequestCopyWith<$Res> {
  factory _$$UserRoleRequestImplCopyWith(_$UserRoleRequestImpl value,
          $Res Function(_$UserRoleRequestImpl) then) =
      __$$UserRoleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int userId, int roleId});
}

/// @nodoc
class __$$UserRoleRequestImplCopyWithImpl<$Res>
    extends _$UserRoleRequestCopyWithImpl<$Res, _$UserRoleRequestImpl>
    implements _$$UserRoleRequestImplCopyWith<$Res> {
  __$$UserRoleRequestImplCopyWithImpl(
      _$UserRoleRequestImpl _value, $Res Function(_$UserRoleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleId = null,
  }) {
    return _then(_$UserRoleRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRoleRequestImpl implements _UserRoleRequest {
  const _$UserRoleRequestImpl({required this.userId, required this.roleId});

  factory _$UserRoleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRoleRequestImplFromJson(json);

  @override
  final int userId;
  @override
  final int roleId;

  @override
  String toString() {
    return 'UserRoleRequest(userId: $userId, roleId: $roleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, roleId);

  /// Create a copy of UserRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleRequestImplCopyWith<_$UserRoleRequestImpl> get copyWith =>
      __$$UserRoleRequestImplCopyWithImpl<_$UserRoleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRoleRequestImplToJson(
      this,
    );
  }
}

abstract class _UserRoleRequest implements UserRoleRequest {
  const factory _UserRoleRequest(
      {required final int userId,
      required final int roleId}) = _$UserRoleRequestImpl;

  factory _UserRoleRequest.fromJson(Map<String, dynamic> json) =
      _$UserRoleRequestImpl.fromJson;

  @override
  int get userId;
  @override
  int get roleId;

  /// Create a copy of UserRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleRequestImplCopyWith<_$UserRoleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
