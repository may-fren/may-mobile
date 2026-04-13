// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Role to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res, Role>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res, $Val extends Role>
    implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdDate = null,
    Object? createdBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleImplCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$RoleImplCopyWith(
          _$RoleImpl value, $Res Function(_$RoleImpl) then) =
      __$$RoleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class __$$RoleImplCopyWithImpl<$Res>
    extends _$RoleCopyWithImpl<$Res, _$RoleImpl>
    implements _$$RoleImplCopyWith<$Res> {
  __$$RoleImplCopyWithImpl(_$RoleImpl _value, $Res Function(_$RoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
    Object? createdDate = null,
    Object? createdBy = null,
  }) {
    return _then(_$RoleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleImpl implements _Role {
  const _$RoleImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.status,
      required this.createdDate,
      required this.createdBy});

  factory _$RoleImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String status;
  @override
  final String createdDate;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'Role(id: $id, name: $name, description: $description, status: $status, createdDate: $createdDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, status, createdDate, createdBy);

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      __$$RoleImplCopyWithImpl<_$RoleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleImplToJson(
      this,
    );
  }
}

abstract class _Role implements Role {
  const factory _Role(
      {required final int id,
      required final String name,
      final String? description,
      required final String status,
      required final String createdDate,
      required final String createdBy}) = _$RoleImpl;

  factory _Role.fromJson(Map<String, dynamic> json) = _$RoleImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String get status;
  @override
  String get createdDate;
  @override
  String get createdBy;

  /// Create a copy of Role
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoleImplCopyWith<_$RoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRoleRequest _$CreateRoleRequestFromJson(Map<String, dynamic> json) {
  return _CreateRoleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateRoleRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CreateRoleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateRoleRequestCopyWith<CreateRoleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRoleRequestCopyWith<$Res> {
  factory $CreateRoleRequestCopyWith(
          CreateRoleRequest value, $Res Function(CreateRoleRequest) then) =
      _$CreateRoleRequestCopyWithImpl<$Res, CreateRoleRequest>;
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class _$CreateRoleRequestCopyWithImpl<$Res, $Val extends CreateRoleRequest>
    implements $CreateRoleRequestCopyWith<$Res> {
  _$CreateRoleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRoleRequestImplCopyWith<$Res>
    implements $CreateRoleRequestCopyWith<$Res> {
  factory _$$CreateRoleRequestImplCopyWith(_$CreateRoleRequestImpl value,
          $Res Function(_$CreateRoleRequestImpl) then) =
      __$$CreateRoleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description});
}

/// @nodoc
class __$$CreateRoleRequestImplCopyWithImpl<$Res>
    extends _$CreateRoleRequestCopyWithImpl<$Res, _$CreateRoleRequestImpl>
    implements _$$CreateRoleRequestImplCopyWith<$Res> {
  __$$CreateRoleRequestImplCopyWithImpl(_$CreateRoleRequestImpl _value,
      $Res Function(_$CreateRoleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
  }) {
    return _then(_$CreateRoleRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRoleRequestImpl implements _CreateRoleRequest {
  const _$CreateRoleRequestImpl({required this.name, this.description});

  factory _$CreateRoleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRoleRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;

  @override
  String toString() {
    return 'CreateRoleRequest(name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRoleRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description);

  /// Create a copy of CreateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRoleRequestImplCopyWith<_$CreateRoleRequestImpl> get copyWith =>
      __$$CreateRoleRequestImplCopyWithImpl<_$CreateRoleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRoleRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateRoleRequest implements CreateRoleRequest {
  const factory _CreateRoleRequest(
      {required final String name,
      final String? description}) = _$CreateRoleRequestImpl;

  factory _CreateRoleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateRoleRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;

  /// Create a copy of CreateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRoleRequestImplCopyWith<_$CreateRoleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateRoleRequest _$UpdateRoleRequestFromJson(Map<String, dynamic> json) {
  return _UpdateRoleRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateRoleRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateRoleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateRoleRequestCopyWith<UpdateRoleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateRoleRequestCopyWith<$Res> {
  factory $UpdateRoleRequestCopyWith(
          UpdateRoleRequest value, $Res Function(UpdateRoleRequest) then) =
      _$UpdateRoleRequestCopyWithImpl<$Res, UpdateRoleRequest>;
  @useResult
  $Res call({String name, String? description, String status});
}

/// @nodoc
class _$UpdateRoleRequestCopyWithImpl<$Res, $Val extends UpdateRoleRequest>
    implements $UpdateRoleRequestCopyWith<$Res> {
  _$UpdateRoleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateRoleRequestImplCopyWith<$Res>
    implements $UpdateRoleRequestCopyWith<$Res> {
  factory _$$UpdateRoleRequestImplCopyWith(_$UpdateRoleRequestImpl value,
          $Res Function(_$UpdateRoleRequestImpl) then) =
      __$$UpdateRoleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description, String status});
}

/// @nodoc
class __$$UpdateRoleRequestImplCopyWithImpl<$Res>
    extends _$UpdateRoleRequestCopyWithImpl<$Res, _$UpdateRoleRequestImpl>
    implements _$$UpdateRoleRequestImplCopyWith<$Res> {
  __$$UpdateRoleRequestImplCopyWithImpl(_$UpdateRoleRequestImpl _value,
      $Res Function(_$UpdateRoleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
  }) {
    return _then(_$UpdateRoleRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateRoleRequestImpl implements _UpdateRoleRequest {
  const _$UpdateRoleRequestImpl(
      {required this.name, this.description, required this.status});

  factory _$UpdateRoleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateRoleRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateRoleRequest(name: $name, description: $description, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRoleRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, status);

  /// Create a copy of UpdateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRoleRequestImplCopyWith<_$UpdateRoleRequestImpl> get copyWith =>
      __$$UpdateRoleRequestImplCopyWithImpl<_$UpdateRoleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateRoleRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateRoleRequest implements UpdateRoleRequest {
  const factory _UpdateRoleRequest(
      {required final String name,
      final String? description,
      required final String status}) = _$UpdateRoleRequestImpl;

  factory _UpdateRoleRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateRoleRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String get status;

  /// Create a copy of UpdateRoleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateRoleRequestImplCopyWith<_$UpdateRoleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
