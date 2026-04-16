class UserSession {
  final int id;
  final String platform;
  final String? deviceInfo;
  final String ipAddress;
  final String? loginDate;
  final String? lastActivityDate;
  final bool currentSession;

  UserSession({
    required this.id,
    required this.platform,
    this.deviceInfo,
    required this.ipAddress,
    this.loginDate,
    this.lastActivityDate,
    this.currentSession = false,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      id: json['id'] as int,
      platform: json['platform'] as String,
      deviceInfo: json['deviceInfo'] as String?,
      ipAddress: json['ipAddress'] as String,
      loginDate: json['loginDate'] as String?,
      lastActivityDate: json['lastActivityDate'] as String?,
      currentSession: json['currentSession'] as bool? ?? false,
    );
  }
}
