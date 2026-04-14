import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_model.freezed.dart';
part 'module_model.g.dart';

@freezed
class Module with _$Module {
  const factory Module({
    required int id,
    required String name,
    required String brand,
    required String model,
    int? year,
    required String code,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _Module;

  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}

@freezed
class CreateModuleRequest with _$CreateModuleRequest {
  const factory CreateModuleRequest({
    required String name,
    required String brand,
    required String model,
    int? year,
    required String code,
  }) = _CreateModuleRequest;

  factory CreateModuleRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateModuleRequestFromJson(json);
}

@freezed
class UpdateModuleRequest with _$UpdateModuleRequest {
  const factory UpdateModuleRequest({
    required String name,
    required String brand,
    required String model,
    int? year,
    required String code,
    required String status,
  }) = _UpdateModuleRequest;

  factory UpdateModuleRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateModuleRequestFromJson(json);
}
