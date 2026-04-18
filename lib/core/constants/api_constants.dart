class ApiConstants {
  ApiConstants._();

  static String get baseUrl {
    return 'https://may-backend.onbtech.com/api/v1';
  }

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';

  // Resources
  static const String users = '/users';
  static const String roles = '/roles';
  static const String permissions = '/permissions';
  static const String userRoles = '/user-roles';
  static const String rolePermissions = '/role-permissions';
  static const String modules = '/modules';
  static const String analyses = '/analyses';
  static const String tests = '/tests';
  static const String services = '/services';

  // Sessions
  static const String sessions = '/sessions';
  static const String mySessions = '/sessions/me';
}
