// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestItem _$TestItemFromJson(Map<String, dynamic> json) {
  return _TestItem.fromJson(json);
}

/// @nodoc
mixin _$TestItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this TestItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestItemCopyWith<TestItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestItemCopyWith<$Res> {
  factory $TestItemCopyWith(TestItem value, $Res Function(TestItem) then) =
      _$TestItemCopyWithImpl<$Res, TestItem>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int moduleId,
      String moduleName,
      String? note,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class _$TestItemCopyWithImpl<$Res, $Val extends TestItem>
    implements $TestItemCopyWith<$Res> {
  _$TestItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TestItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? moduleName = null,
    Object? note = freezed,
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
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TestItemImplCopyWith<$Res>
    implements $TestItemCopyWith<$Res> {
  factory _$$TestItemImplCopyWith(
          _$TestItemImpl value, $Res Function(_$TestItemImpl) then) =
      __$$TestItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? description,
      int moduleId,
      String moduleName,
      String? note,
      String status,
      String createdDate,
      String createdBy});
}

/// @nodoc
class __$$TestItemImplCopyWithImpl<$Res>
    extends _$TestItemCopyWithImpl<$Res, _$TestItemImpl>
    implements _$$TestItemImplCopyWith<$Res> {
  __$$TestItemImplCopyWithImpl(
      _$TestItemImpl _value, $Res Function(_$TestItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TestItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? moduleName = null,
    Object? note = freezed,
    Object? status = null,
    Object? createdDate = null,
    Object? createdBy = null,
  }) {
    return _then(_$TestItemImpl(
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
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
class _$TestItemImpl implements _TestItem {
  const _$TestItemImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.moduleId,
      required this.moduleName,
      this.note,
      required this.status,
      required this.createdDate,
      required this.createdBy});

  factory _$TestItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestItemImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int moduleId;
  @override
  final String moduleName;
  @override
  final String? note;
  @override
  final String status;
  @override
  final String createdDate;
  @override
  final String createdBy;

  @override
  String toString() {
    return 'TestItem(id: $id, name: $name, description: $description, moduleId: $moduleId, moduleName: $moduleName, note: $note, status: $status, createdDate: $createdDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, moduleId,
      moduleName, note, status, createdDate, createdBy);

  /// Create a copy of TestItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestItemImplCopyWith<_$TestItemImpl> get copyWith =>
      __$$TestItemImplCopyWithImpl<_$TestItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestItemImplToJson(
      this,
    );
  }
}

abstract class _TestItem implements TestItem {
  const factory _TestItem(
      {required final int id,
      required final String name,
      final String? description,
      required final int moduleId,
      required final String moduleName,
      final String? note,
      required final String status,
      required final String createdDate,
      required final String createdBy}) = _$TestItemImpl;

  factory _TestItem.fromJson(Map<String, dynamic> json) =
      _$TestItemImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  int get moduleId;
  @override
  String get moduleName;
  @override
  String? get note;
  @override
  String get status;
  @override
  String get createdDate;
  @override
  String get createdBy;

  /// Create a copy of TestItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestItemImplCopyWith<_$TestItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTestRequest _$CreateTestRequestFromJson(Map<String, dynamic> json) {
  return _CreateTestRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTestRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateTestRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTestRequestCopyWith<CreateTestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTestRequestCopyWith<$Res> {
  factory $CreateTestRequestCopyWith(
          CreateTestRequest value, $Res Function(CreateTestRequest) then) =
      _$CreateTestRequestCopyWithImpl<$Res, CreateTestRequest>;
  @useResult
  $Res call({String name, String? description, int moduleId, String? note});
}

/// @nodoc
class _$CreateTestRequestCopyWithImpl<$Res, $Val extends CreateTestRequest>
    implements $CreateTestRequestCopyWith<$Res> {
  _$CreateTestRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? note = freezed,
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
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTestRequestImplCopyWith<$Res>
    implements $CreateTestRequestCopyWith<$Res> {
  factory _$$CreateTestRequestImplCopyWith(_$CreateTestRequestImpl value,
          $Res Function(_$CreateTestRequestImpl) then) =
      __$$CreateTestRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description, int moduleId, String? note});
}

/// @nodoc
class __$$CreateTestRequestImplCopyWithImpl<$Res>
    extends _$CreateTestRequestCopyWithImpl<$Res, _$CreateTestRequestImpl>
    implements _$$CreateTestRequestImplCopyWith<$Res> {
  __$$CreateTestRequestImplCopyWithImpl(_$CreateTestRequestImpl _value,
      $Res Function(_$CreateTestRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? note = freezed,
  }) {
    return _then(_$CreateTestRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTestRequestImpl implements _CreateTestRequest {
  const _$CreateTestRequestImpl(
      {required this.name,
      this.description,
      required this.moduleId,
      this.note});

  factory _$CreateTestRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTestRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final int moduleId;
  @override
  final String? note;

  @override
  String toString() {
    return 'CreateTestRequest(name: $name, description: $description, moduleId: $moduleId, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTestRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, moduleId, note);

  /// Create a copy of CreateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTestRequestImplCopyWith<_$CreateTestRequestImpl> get copyWith =>
      __$$CreateTestRequestImplCopyWithImpl<_$CreateTestRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTestRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTestRequest implements CreateTestRequest {
  const factory _CreateTestRequest(
      {required final String name,
      final String? description,
      required final int moduleId,
      final String? note}) = _$CreateTestRequestImpl;

  factory _CreateTestRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTestRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  int get moduleId;
  @override
  String? get note;

  /// Create a copy of CreateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTestRequestImplCopyWith<_$CreateTestRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateTestRequest _$UpdateTestRequestFromJson(Map<String, dynamic> json) {
  return _UpdateTestRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTestRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateTestRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTestRequestCopyWith<UpdateTestRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTestRequestCopyWith<$Res> {
  factory $UpdateTestRequestCopyWith(
          UpdateTestRequest value, $Res Function(UpdateTestRequest) then) =
      _$UpdateTestRequestCopyWithImpl<$Res, UpdateTestRequest>;
  @useResult
  $Res call(
      {String name,
      String? description,
      int moduleId,
      String? note,
      String status});
}

/// @nodoc
class _$UpdateTestRequestCopyWithImpl<$Res, $Val extends UpdateTestRequest>
    implements $UpdateTestRequestCopyWith<$Res> {
  _$UpdateTestRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? note = freezed,
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
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTestRequestImplCopyWith<$Res>
    implements $UpdateTestRequestCopyWith<$Res> {
  factory _$$UpdateTestRequestImplCopyWith(_$UpdateTestRequestImpl value,
          $Res Function(_$UpdateTestRequestImpl) then) =
      __$$UpdateTestRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      int moduleId,
      String? note,
      String status});
}

/// @nodoc
class __$$UpdateTestRequestImplCopyWithImpl<$Res>
    extends _$UpdateTestRequestCopyWithImpl<$Res, _$UpdateTestRequestImpl>
    implements _$$UpdateTestRequestImplCopyWith<$Res> {
  __$$UpdateTestRequestImplCopyWithImpl(_$UpdateTestRequestImpl _value,
      $Res Function(_$UpdateTestRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? note = freezed,
    Object? status = null,
  }) {
    return _then(_$UpdateTestRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleId: null == moduleId
          ? _value.moduleId
          : moduleId // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
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
class _$UpdateTestRequestImpl implements _UpdateTestRequest {
  const _$UpdateTestRequestImpl(
      {required this.name,
      this.description,
      required this.moduleId,
      this.note,
      required this.status});

  factory _$UpdateTestRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTestRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final int moduleId;
  @override
  final String? note;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateTestRequest(name: $name, description: $description, moduleId: $moduleId, note: $note, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTestRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, moduleId, note, status);

  /// Create a copy of UpdateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTestRequestImplCopyWith<_$UpdateTestRequestImpl> get copyWith =>
      __$$UpdateTestRequestImplCopyWithImpl<_$UpdateTestRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTestRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateTestRequest implements UpdateTestRequest {
  const factory _UpdateTestRequest(
      {required final String name,
      final String? description,
      required final int moduleId,
      final String? note,
      required final String status}) = _$UpdateTestRequestImpl;

  factory _UpdateTestRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTestRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  int get moduleId;
  @override
  String? get note;
  @override
  String get status;

  /// Create a copy of UpdateTestRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTestRequestImplCopyWith<_$UpdateTestRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
