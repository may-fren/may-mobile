// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get module => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Permission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? module,
      String? action,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
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
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PermissionImplCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$PermissionImplCopyWith(
          _$PermissionImpl value, $Res Function(_$PermissionImpl) then) =
      __$$PermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      String? module,
      String? action,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class __$$PermissionImplCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$PermissionImpl>
    implements _$$PermissionImplCopyWith<$Res> {
  __$$PermissionImplCopyWithImpl(
      _$PermissionImpl _value, $Res Function(_$PermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
    Object? status = null,
    Object? createdDate = null,
    Object? createdBy = null,
  }) {
    return _then(_$PermissionImpl(
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
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
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
class _$PermissionImpl implements _Permission {
  const _$PermissionImpl(
      {required this.id,
      required this.name,
      this.description,
      this.module,
      this.action,
      required this.status,
      required this.createdDate,
      required this.createdBy});

  factory _$PermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? module;
  @override
  final String? action;
  @override
  final String status;
  @override
  final String createdDate;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'Permission(id: $id, name: $name, description: $description, module: $module, action: $action, status: $status, createdDate: $createdDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, module,
      action, status, createdDate, createdBy);

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      __$$PermissionImplCopyWithImpl<_$PermissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionImplToJson(
      this,
    );
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {required final int id,
      required final String name,
      final String? description,
      final String? module,
      final String? action,
      required final String status,
      required final String createdDate,
      required final String createdBy}) = _$PermissionImpl;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$PermissionImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get module;
  @override
  String? get action;
  @override
  String get status;
  @override
  String get createdDate;
  @override
  String get createdBy;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatePermissionRequest _$CreatePermissionRequestFromJson(
    Map<String, dynamic> json) {
  return _CreatePermissionRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePermissionRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get module => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;

  /// Serializes this CreatePermissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePermissionRequestCopyWith<CreatePermissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePermissionRequestCopyWith<$Res> {
  factory $CreatePermissionRequestCopyWith(CreatePermissionRequest value,
          $Res Function(CreatePermissionRequest) then) =
      _$CreatePermissionRequestCopyWithImpl<$Res, CreatePermissionRequest>;
  @useResult
  $Res call({String name, String? description, String? module, String? action});
}

/// @nodoc
class _$CreatePermissionRequestCopyWithImpl<$Res,
        $Val extends CreatePermissionRequest>
    implements $CreatePermissionRequestCopyWith<$Res> {
  _$CreatePermissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
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
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePermissionRequestImplCopyWith<$Res>
    implements $CreatePermissionRequestCopyWith<$Res> {
  factory _$$CreatePermissionRequestImplCopyWith(
          _$CreatePermissionRequestImpl value,
          $Res Function(_$CreatePermissionRequestImpl) then) =
      __$$CreatePermissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description, String? module, String? action});
}

/// @nodoc
class __$$CreatePermissionRequestImplCopyWithImpl<$Res>
    extends _$CreatePermissionRequestCopyWithImpl<$Res,
        _$CreatePermissionRequestImpl>
    implements _$$CreatePermissionRequestImplCopyWith<$Res> {
  __$$CreatePermissionRequestImplCopyWithImpl(
      _$CreatePermissionRequestImpl _value,
      $Res Function(_$CreatePermissionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
  }) {
    return _then(_$CreatePermissionRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePermissionRequestImpl implements _CreatePermissionRequest {
  const _$CreatePermissionRequestImpl(
      {required this.name, this.description, this.module, this.action});

  factory _$CreatePermissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePermissionRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? module;
  @override
  final String? action;

  @override
  String toString() {
    return 'CreatePermissionRequest(name: $name, description: $description, module: $module, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePermissionRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.action, action) || other.action == action));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, module, action);

  /// Create a copy of CreatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePermissionRequestImplCopyWith<_$CreatePermissionRequestImpl>
      get copyWith => __$$CreatePermissionRequestImplCopyWithImpl<
          _$CreatePermissionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePermissionRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePermissionRequest implements CreatePermissionRequest {
  const factory _CreatePermissionRequest(
      {required final String name,
      final String? description,
      final String? module,
      final String? action}) = _$CreatePermissionRequestImpl;

  factory _CreatePermissionRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePermissionRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String? get module;
  @override
  String? get action;

  /// Create a copy of CreatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePermissionRequestImplCopyWith<_$CreatePermissionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdatePermissionRequest _$UpdatePermissionRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdatePermissionRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePermissionRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get module => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdatePermissionRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePermissionRequestCopyWith<UpdatePermissionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePermissionRequestCopyWith<$Res> {
  factory $UpdatePermissionRequestCopyWith(UpdatePermissionRequest value,
          $Res Function(UpdatePermissionRequest) then) =
      _$UpdatePermissionRequestCopyWithImpl<$Res, UpdatePermissionRequest>;
  @useResult
  $Res call(
      {String name,
      String? description,
      String? module,
      String? action,
      String status});
}

/// @nodoc
class _$UpdatePermissionRequestCopyWithImpl<$Res,
        $Val extends UpdatePermissionRequest>
    implements $UpdatePermissionRequestCopyWith<$Res> {
  _$UpdatePermissionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
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
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePermissionRequestImplCopyWith<$Res>
    implements $UpdatePermissionRequestCopyWith<$Res> {
  factory _$$UpdatePermissionRequestImplCopyWith(
          _$UpdatePermissionRequestImpl value,
          $Res Function(_$UpdatePermissionRequestImpl) then) =
      __$$UpdatePermissionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String? module,
      String? action,
      String status});
}

/// @nodoc
class __$$UpdatePermissionRequestImplCopyWithImpl<$Res>
    extends _$UpdatePermissionRequestCopyWithImpl<$Res,
        _$UpdatePermissionRequestImpl>
    implements _$$UpdatePermissionRequestImplCopyWith<$Res> {
  __$$UpdatePermissionRequestImplCopyWithImpl(
      _$UpdatePermissionRequestImpl _value,
      $Res Function(_$UpdatePermissionRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? module = freezed,
    Object? action = freezed,
    Object? status = null,
  }) {
    return _then(_$UpdatePermissionRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      module: freezed == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
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
class _$UpdatePermissionRequestImpl implements _UpdatePermissionRequest {
  const _$UpdatePermissionRequestImpl(
      {required this.name,
      this.description,
      this.module,
      this.action,
      required this.status});

  factory _$UpdatePermissionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePermissionRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? module;
  @override
  final String? action;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdatePermissionRequest(name: $name, description: $description, module: $module, action: $action, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePermissionRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, module, action, status);

  /// Create a copy of UpdatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePermissionRequestImplCopyWith<_$UpdatePermissionRequestImpl>
      get copyWith => __$$UpdatePermissionRequestImplCopyWithImpl<
          _$UpdatePermissionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePermissionRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdatePermissionRequest implements UpdatePermissionRequest {
  const factory _UpdatePermissionRequest(
      {required final String name,
      final String? description,
      final String? module,
      final String? action,
      required final String status}) = _$UpdatePermissionRequestImpl;

  factory _UpdatePermissionRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePermissionRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  String? get module;
  @override
  String? get action;
  @override
  String get status;

  /// Create a copy of UpdatePermissionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePermissionRequestImplCopyWith<_$UpdatePermissionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
