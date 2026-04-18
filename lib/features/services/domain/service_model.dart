import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceItem with _$ServiceItem {
  const factory ServiceItem({
    required int id,
    required String name,
    String? city,
    String? town,
    String? address,
    required String status,
    required String createdDate,
    required String createdBy,
  }) = _ServiceItem;

  factory ServiceItem.fromJson(Map<String, dynamic> json) =>
      _$ServiceItemFromJson(json);
}

@freezed
class CreateServiceRequest with _$CreateServiceRequest {
  const factory CreateServiceRequest({
    required String name,
    String? city,
    String? town,
    String? address,
  }) = _CreateServiceRequest;

  factory CreateServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateServiceRequestFromJson(json);
}

@freezed
class UpdateServiceRequest with _$UpdateServiceRequest {
  const factory UpdateServiceRequest({
    required String name,
    String? city,
    String? town,
    String? address,
    required String status,
  }) = _UpdateServiceRequest;

  factory UpdateServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateServiceRequestFromJson(json);
}
