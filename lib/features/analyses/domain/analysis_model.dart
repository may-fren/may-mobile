import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_model.freezed.dart';
part 'analysis_model.g.dart';

@freezed
class Analysis with _$Analysis {
  const factory Analysis({
    required int id,
    required String name,
    String? description,
    required int moduleId,
    required String moduleName,
    String? note,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _Analysis;

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);
}

@freezed
class CreateAnalysisRequest with _$CreateAnalysisRequest {
  const factory CreateAnalysisRequest({
    required String name,
    String? description,
    required int moduleId,
    String? note,
  }) = _CreateAnalysisRequest;

  factory CreateAnalysisRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAnalysisRequestFromJson(json);
}

@freezed
class UpdateAnalysisRequest with _$UpdateAnalysisRequest {
  const factory UpdateAnalysisRequest({
    required String name,
    String? description,
    required int moduleId,
    String? note,
    required String status,
  }) = _UpdateAnalysisRequest;

  factory UpdateAnalysisRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAnalysisRequestFromJson(json);
}
