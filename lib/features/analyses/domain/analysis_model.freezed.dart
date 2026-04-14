// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Analysis _$AnalysisFromJson(Map<String, dynamic> json) {
  return _Analysis.fromJson(json);
}

/// @nodoc
mixin _$Analysis {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;

  /// Serializes this Analysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisCopyWith<Analysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisCopyWith<$Res> {
  factory $AnalysisCopyWith(Analysis value, $Res Function(Analysis) then) =
      _$AnalysisCopyWithImpl<$Res, Analysis>;
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
class _$AnalysisCopyWithImpl<$Res, $Val extends Analysis>
    implements $AnalysisCopyWith<$Res> {
  _$AnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Analysis
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
abstract class _$$AnalysisImplCopyWith<$Res>
    implements $AnalysisCopyWith<$Res> {
  factory _$$AnalysisImplCopyWith(
          _$AnalysisImpl value, $Res Function(_$AnalysisImpl) then) =
      __$$AnalysisImplCopyWithImpl<$Res>;
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
class __$$AnalysisImplCopyWithImpl<$Res>
    extends _$AnalysisCopyWithImpl<$Res, _$AnalysisImpl>
    implements _$$AnalysisImplCopyWith<$Res> {
  __$$AnalysisImplCopyWithImpl(
      _$AnalysisImpl _value, $Res Function(_$AnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of Analysis
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
    return _then(_$AnalysisImpl(
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
class _$AnalysisImpl implements _Analysis {
  const _$AnalysisImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.moduleId,
      required this.moduleName,
      this.note,
      required this.status,
      required this.createdDate,
      required this.createdBy});

  factory _$AnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalysisImplFromJson(json);

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
    return 'Analysis(id: $id, name: $name, description: $description, moduleId: $moduleId, moduleName: $moduleName, note: $note, status: $status, createdDate: $createdDate, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisImpl &&
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

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisImplCopyWith<_$AnalysisImpl> get copyWith =>
      __$$AnalysisImplCopyWithImpl<_$AnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalysisImplToJson(
      this,
    );
  }
}

abstract class _Analysis implements Analysis {
  const factory _Analysis(
      {required final int id,
      required final String name,
      final String? description,
      required final int moduleId,
      required final String moduleName,
      final String? note,
      required final String status,
      required final String createdDate,
      required final String createdBy}) = _$AnalysisImpl;

  factory _Analysis.fromJson(Map<String, dynamic> json) =
      _$AnalysisImpl.fromJson;

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

  /// Create a copy of Analysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisImplCopyWith<_$AnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateAnalysisRequest _$CreateAnalysisRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateAnalysisRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateAnalysisRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this CreateAnalysisRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAnalysisRequestCopyWith<CreateAnalysisRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAnalysisRequestCopyWith<$Res> {
  factory $CreateAnalysisRequestCopyWith(CreateAnalysisRequest value,
          $Res Function(CreateAnalysisRequest) then) =
      _$CreateAnalysisRequestCopyWithImpl<$Res, CreateAnalysisRequest>;
  @useResult
  $Res call({String name, String? description, int moduleId, String? note});
}

/// @nodoc
class _$CreateAnalysisRequestCopyWithImpl<$Res,
        $Val extends CreateAnalysisRequest>
    implements $CreateAnalysisRequestCopyWith<$Res> {
  _$CreateAnalysisRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAnalysisRequest
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
abstract class _$$CreateAnalysisRequestImplCopyWith<$Res>
    implements $CreateAnalysisRequestCopyWith<$Res> {
  factory _$$CreateAnalysisRequestImplCopyWith(
          _$CreateAnalysisRequestImpl value,
          $Res Function(_$CreateAnalysisRequestImpl) then) =
      __$$CreateAnalysisRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? description, int moduleId, String? note});
}

/// @nodoc
class __$$CreateAnalysisRequestImplCopyWithImpl<$Res>
    extends _$CreateAnalysisRequestCopyWithImpl<$Res,
        _$CreateAnalysisRequestImpl>
    implements _$$CreateAnalysisRequestImplCopyWith<$Res> {
  __$$CreateAnalysisRequestImplCopyWithImpl(_$CreateAnalysisRequestImpl _value,
      $Res Function(_$CreateAnalysisRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? moduleId = null,
    Object? note = freezed,
  }) {
    return _then(_$CreateAnalysisRequestImpl(
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
class _$CreateAnalysisRequestImpl implements _CreateAnalysisRequest {
  const _$CreateAnalysisRequestImpl(
      {required this.name,
      this.description,
      required this.moduleId,
      this.note});

  factory _$CreateAnalysisRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAnalysisRequestImplFromJson(json);

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
    return 'CreateAnalysisRequest(name: $name, description: $description, moduleId: $moduleId, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAnalysisRequestImpl &&
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

  /// Create a copy of CreateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAnalysisRequestImplCopyWith<_$CreateAnalysisRequestImpl>
      get copyWith => __$$CreateAnalysisRequestImplCopyWithImpl<
          _$CreateAnalysisRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAnalysisRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateAnalysisRequest implements CreateAnalysisRequest {
  const factory _CreateAnalysisRequest(
      {required final String name,
      final String? description,
      required final int moduleId,
      final String? note}) = _$CreateAnalysisRequestImpl;

  factory _CreateAnalysisRequest.fromJson(Map<String, dynamic> json) =
      _$CreateAnalysisRequestImpl.fromJson;

  @override
  String get name;
  @override
  String? get description;
  @override
  int get moduleId;
  @override
  String? get note;

  /// Create a copy of CreateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAnalysisRequestImplCopyWith<_$CreateAnalysisRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateAnalysisRequest _$UpdateAnalysisRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateAnalysisRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateAnalysisRequest {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get moduleId => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this UpdateAnalysisRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateAnalysisRequestCopyWith<UpdateAnalysisRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateAnalysisRequestCopyWith<$Res> {
  factory $UpdateAnalysisRequestCopyWith(UpdateAnalysisRequest value,
          $Res Function(UpdateAnalysisRequest) then) =
      _$UpdateAnalysisRequestCopyWithImpl<$Res, UpdateAnalysisRequest>;
  @useResult
  $Res call(
      {String name,
      String? description,
      int moduleId,
      String? note,
      String status});
}

/// @nodoc
class _$UpdateAnalysisRequestCopyWithImpl<$Res,
        $Val extends UpdateAnalysisRequest>
    implements $UpdateAnalysisRequestCopyWith<$Res> {
  _$UpdateAnalysisRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateAnalysisRequest
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
abstract class _$$UpdateAnalysisRequestImplCopyWith<$Res>
    implements $UpdateAnalysisRequestCopyWith<$Res> {
  factory _$$UpdateAnalysisRequestImplCopyWith(
          _$UpdateAnalysisRequestImpl value,
          $Res Function(_$UpdateAnalysisRequestImpl) then) =
      __$$UpdateAnalysisRequestImplCopyWithImpl<$Res>;
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
class __$$UpdateAnalysisRequestImplCopyWithImpl<$Res>
    extends _$UpdateAnalysisRequestCopyWithImpl<$Res,
        _$UpdateAnalysisRequestImpl>
    implements _$$UpdateAnalysisRequestImplCopyWith<$Res> {
  __$$UpdateAnalysisRequestImplCopyWithImpl(_$UpdateAnalysisRequestImpl _value,
      $Res Function(_$UpdateAnalysisRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateAnalysisRequest
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
    return _then(_$UpdateAnalysisRequestImpl(
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
class _$UpdateAnalysisRequestImpl implements _UpdateAnalysisRequest {
  const _$UpdateAnalysisRequestImpl(
      {required this.name,
      this.description,
      required this.moduleId,
      this.note,
      required this.status});

  factory _$UpdateAnalysisRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateAnalysisRequestImplFromJson(json);

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
    return 'UpdateAnalysisRequest(name: $name, description: $description, moduleId: $moduleId, note: $note, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAnalysisRequestImpl &&
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

  /// Create a copy of UpdateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAnalysisRequestImplCopyWith<_$UpdateAnalysisRequestImpl>
      get copyWith => __$$UpdateAnalysisRequestImplCopyWithImpl<
          _$UpdateAnalysisRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateAnalysisRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateAnalysisRequest implements UpdateAnalysisRequest {
  const factory _UpdateAnalysisRequest(
      {required final String name,
      final String? description,
      required final int moduleId,
      final String? note,
      required final String status}) = _$UpdateAnalysisRequestImpl;

  factory _UpdateAnalysisRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateAnalysisRequestImpl.fromJson;

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

  /// Create a copy of UpdateAnalysisRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAnalysisRequestImplCopyWith<_$UpdateAnalysisRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
