import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_model.freezed.dart';
part 'test_model.g.dart';

@freezed
class TestItem with _$TestItem {
  const factory TestItem({
    required int id,
    required String name,
    String? description,
    required int moduleId,
    required String moduleName,
    String? note,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _TestItem;

  factory TestItem.fromJson(Map<String, dynamic> json) =>
      _$TestItemFromJson(json);
}

@freezed
class CreateTestRequest with _$CreateTestRequest {
  const factory CreateTestRequest({
    required String name,
    String? description,
    required int moduleId,
    String? note,
  }) = _CreateTestRequest;

  factory CreateTestRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTestRequestFromJson(json);
}

@freezed
class UpdateTestRequest with _$UpdateTestRequest {
  const factory UpdateTestRequest({
    required String name,
    String? description,
    required int moduleId,
    String? note,
    required String status,
  }) = _UpdateTestRequest;

  factory UpdateTestRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateTestRequestFromJson(json);
}
