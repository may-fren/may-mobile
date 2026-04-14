// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'module_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Module _$ModuleFromJson(Map<String, dynamic> json) {
  return _Module.fromJson(json);
}

/// @nodoc
mixin _$Module {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Module to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ModuleCopyWith<Module> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModuleCopyWith<$Res> {
  factory $ModuleCopyWith(Module value, $Res Function(Module) then) =
      _$ModuleCopyWithImpl<$Res, Module>;
  @useResult
  $Res call(
      {int id,
      String name,
      String brand,
      String model,
      int? year,
      String code,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class _$ModuleCopyWithImpl<$Res, $Val extends Module>
    implements $ModuleCopyWith<$Res> {
  _$ModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
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
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$ModuleImplCopyWith<$Res> implements $ModuleCopyWith<$Res> {
  factory _$$ModuleImplCopyWith(
          _$ModuleImpl value, $Res Function(_$ModuleImpl) then) =
      __$$ModuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String brand,
      String model,
      int? year,
      String code,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class __$$ModuleImplCopyWithImpl<$Res>
    extends _$ModuleCopyWithImpl<$Res, _$ModuleImpl>
    implements _$$ModuleImplCopyWith<$Res> {
  __$$ModuleImplCopyWithImpl(
      _$ModuleImpl _value, $Res Function(_$ModuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
    Object? status = null,
    Object? createdDate = null,
    Object? createdBy = null,
  }) {
    return _then(_$ModuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$ModuleImpl implements _Module {
  const _$ModuleImpl(
      {required this.id,
      required this.name,
      required this.brand,
      required this.model,
      this.year,
      required this.code,
      required this.status,
      required this.createdDate,
      required this.createdBy});

  factory _$ModuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModuleImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String brand;
  @override
  final String model;
  @override
  final int? year;
  @override
  final String code;
  @override
  final String status;
  @override
  final String createdDate;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'Module(id: $id, name: $name, brand: $brand, model: $model, year: $year, code: $code, status: $status, createdDate: $createdDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, brand, model, year,
      code, status, createdDate, createdBy);

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      __$$ModuleImplCopyWithImpl<_$ModuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModuleImplToJson(
      this,
    );
  }
}

abstract class _Module implements Module {
  const factory _Module(
      {required final int id,
      required final String name,
      required final String brand,
      required final String model,
      final int? year,
      required final String code,
      required final String status,
      required final String createdDate,
      required final String createdBy}) = _$ModuleImpl;

  factory _Module.fromJson(Map<String, dynamic> json) = _$ModuleImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get brand;
  @override
  String get model;
  @override
  int? get year;
  @override
  String get code;
  @override
  String get status;
  @override
  String get createdDate;
  @override
  String get createdBy;

  /// Create a copy of Module
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ModuleImplCopyWith<_$ModuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateModuleRequest _$CreateModuleRequestFromJson(Map<String, dynamic> json) {
  return _CreateModuleRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateModuleRequest {
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this CreateModuleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateModuleRequestCopyWith<CreateModuleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateModuleRequestCopyWith<$Res> {
  factory $CreateModuleRequestCopyWith(
          CreateModuleRequest value, $Res Function(CreateModuleRequest) then) =
      _$CreateModuleRequestCopyWithImpl<$Res, CreateModuleRequest>;
  @useResult
  $Res call({String name, String brand, String model, int? year, String code});
}

/// @nodoc
class _$CreateModuleRequestCopyWithImpl<$Res, $Val extends CreateModuleRequest>
    implements $CreateModuleRequestCopyWith<$Res> {
  _$CreateModuleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateModuleRequestImplCopyWith<$Res>
    implements $CreateModuleRequestCopyWith<$Res> {
  factory _$$CreateModuleRequestImplCopyWith(_$CreateModuleRequestImpl value,
          $Res Function(_$CreateModuleRequestImpl) then) =
      __$$CreateModuleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String brand, String model, int? year, String code});
}

/// @nodoc
class __$$CreateModuleRequestImplCopyWithImpl<$Res>
    extends _$CreateModuleRequestCopyWithImpl<$Res, _$CreateModuleRequestImpl>
    implements _$$CreateModuleRequestImplCopyWith<$Res> {
  __$$CreateModuleRequestImplCopyWithImpl(_$CreateModuleRequestImpl _value,
      $Res Function(_$CreateModuleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
  }) {
    return _then(_$CreateModuleRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateModuleRequestImpl implements _CreateModuleRequest {
  const _$CreateModuleRequestImpl(
      {required this.name,
      required this.brand,
      required this.model,
      this.year,
      required this.code});

  factory _$CreateModuleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateModuleRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String brand;
  @override
  final String model;
  @override
  final int? year;
  @override
  final String code;

  @override
  String toString() {
    return 'CreateModuleRequest(name: $name, brand: $brand, model: $model, year: $year, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateModuleRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, brand, model, year, code);

  /// Create a copy of CreateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateModuleRequestImplCopyWith<_$CreateModuleRequestImpl> get copyWith =>
      __$$CreateModuleRequestImplCopyWithImpl<_$CreateModuleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateModuleRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateModuleRequest implements CreateModuleRequest {
  const factory _CreateModuleRequest(
      {required final String name,
      required final String brand,
      required final String model,
      final int? year,
      required final String code}) = _$CreateModuleRequestImpl;

  factory _CreateModuleRequest.fromJson(Map<String, dynamic> json) =
      _$CreateModuleRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get brand;
  @override
  String get model;
  @override
  int? get year;
  @override
  String get code;

  /// Create a copy of CreateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateModuleRequestImplCopyWith<_$CreateModuleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateModuleRequest _$UpdateModuleRequestFromJson(Map<String, dynamic> json) {
  return _UpdateModuleRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateModuleRequest {
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateModuleRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateModuleRequestCopyWith<UpdateModuleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateModuleRequestCopyWith<$Res> {
  factory $UpdateModuleRequestCopyWith(
          UpdateModuleRequest value, $Res Function(UpdateModuleRequest) then) =
      _$UpdateModuleRequestCopyWithImpl<$Res, UpdateModuleRequest>;
  @useResult
  $Res call(
      {String name,
      String brand,
      String model,
      int? year,
      String code,
      String status});
}

/// @nodoc
class _$UpdateModuleRequestCopyWithImpl<$Res, $Val extends UpdateModuleRequest>
    implements $UpdateModuleRequestCopyWith<$Res> {
  _$UpdateModuleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateModuleRequestImplCopyWith<$Res>
    implements $UpdateModuleRequestCopyWith<$Res> {
  factory _$$UpdateModuleRequestImplCopyWith(_$UpdateModuleRequestImpl value,
          $Res Function(_$UpdateModuleRequestImpl) then) =
      __$$UpdateModuleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String brand,
      String model,
      int? year,
      String code,
      String status});
}

/// @nodoc
class __$$UpdateModuleRequestImplCopyWithImpl<$Res>
    extends _$UpdateModuleRequestCopyWithImpl<$Res, _$UpdateModuleRequestImpl>
    implements _$$UpdateModuleRequestImplCopyWith<$Res> {
  __$$UpdateModuleRequestImplCopyWithImpl(_$UpdateModuleRequestImpl _value,
      $Res Function(_$UpdateModuleRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? model = null,
    Object? year = freezed,
    Object? code = null,
    Object? status = null,
  }) {
    return _then(_$UpdateModuleRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateModuleRequestImpl implements _UpdateModuleRequest {
  const _$UpdateModuleRequestImpl(
      {required this.name,
      required this.brand,
      required this.model,
      this.year,
      required this.code,
      required this.status});

  factory _$UpdateModuleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateModuleRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String brand;
  @override
  final String model;
  @override
  final int? year;
  @override
  final String code;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateModuleRequest(name: $name, brand: $brand, model: $model, year: $year, code: $code, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateModuleRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, brand, model, year, code, status);

  /// Create a copy of UpdateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateModuleRequestImplCopyWith<_$UpdateModuleRequestImpl> get copyWith =>
      __$$UpdateModuleRequestImplCopyWithImpl<_$UpdateModuleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateModuleRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateModuleRequest implements UpdateModuleRequest {
  const factory _UpdateModuleRequest(
      {required final String name,
      required final String brand,
      required final String model,
      final int? year,
      required final String code,
      required final String status}) = _$UpdateModuleRequestImpl;

  factory _UpdateModuleRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateModuleRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get brand;
  @override
  String get model;
  @override
  int? get year;
  @override
  String get code;
  @override
  String get status;

  /// Create a copy of UpdateModuleRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateModuleRequestImplCopyWith<_$UpdateModuleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
