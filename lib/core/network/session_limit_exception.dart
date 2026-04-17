import 'package:may_mobile/core/network/api_exceptions.dart';

class ActiveSessionInfo {
  final int id;
  final String platform;
  final String? deviceInfo;
  final String ipAddress;

  ActiveSessionInfo({
    required this.id,
    required this.platform,
    this.deviceInfo,
    required this.ipAddress,
  });

  factory ActiveSessionInfo.fromJson(Map<String, dynamic> json) {
    return ActiveSessionInfo(
      id: (json['id'] as num).toInt(),
      platform: json['platform'] as String,
      deviceInfo: json['deviceInfo'] as String?,
      ipAddress: json['ipAddress'] as String,
    );
  }
}

class SessionLimitException extends ApiException {
  final List<ActiveSessionInfo> activeSessions;

  SessionLimitException({
    required super.message,
    super.statusCode,
    required this.activeSessions,
  });
}
