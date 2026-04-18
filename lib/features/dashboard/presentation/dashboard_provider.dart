import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/users/data/user_repository.dart';
import 'package:may_mobile/features/users/domain/user_model.dart';
import 'package:may_mobile/features/modules/data/module_repository.dart';
import 'package:may_mobile/features/modules/domain/module_model.dart';
import 'package:may_mobile/features/analyses/data/analysis_repository.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/features/tests/data/test_repository.dart';
import 'package:may_mobile/features/tests/domain/test_model.dart';
import 'package:may_mobile/features/services/data/service_repository.dart';
import 'package:may_mobile/features/services/domain/service_model.dart';
import 'package:may_mobile/features/roles/data/role_repository.dart';
import 'package:may_mobile/features/permissions/data/permission_repository.dart';

class DashboardStats {
  final int users;
  final int modules;
  final int analyses;
  final int tests;
  final int services;
  final int roles;
  final int permissions;
  final List<Module> recentModules;
  final List<Analysis> recentAnalyses;
  final List<TestItem> recentTests;
  final List<User> recentLogins;
  final List<User> allUsers;
  final List<ServiceItem> allServices;
  final List<Module> allModules;

  const DashboardStats({
    required this.users,
    required this.modules,
    required this.analyses,
    required this.tests,
    required this.services,
    required this.roles,
    required this.permissions,
    required this.recentModules,
    required this.recentAnalyses,
    required this.recentTests,
    required this.recentLogins,
    required this.allUsers,
    required this.allServices,
    required this.allModules,
  });
}

final dashboardProvider = FutureProvider<DashboardStats>((ref) async {
  final dio = ref.watch(dioProvider);
  final userRepo = UserRepository(dio: dio);
  final moduleRepo = ModuleRepository(dio: dio);
  final analysisRepo = AnalysisRepository(dio: dio);
  final testRepo = TestRepository(dio: dio);
  final serviceRepo = ServiceRepository(dio: dio);
  final roleRepo = RoleRepository(dio: dio);
  final permissionRepo = PermissionRepository(dio: dio);

  final results = await Future.wait([
    userRepo.getUsers(page: 0, size: 100, sort: 'createdDate,desc'),
    moduleRepo.getModules(page: 0, size: 100, sort: 'createdDate,desc'),
    analysisRepo.getAnalyses(page: 0, size: 5, sort: 'createdDate,desc'),
    testRepo.getTests(page: 0, size: 5, sort: 'createdDate,desc'),
    serviceRepo.getServices(page: 0, size: 100, sort: 'createdDate,desc'),
    roleRepo.getRoles(page: 0, size: 1, sort: 'name,asc'),
    permissionRepo.getPermissions(page: 0, size: 1, sort: 'name,asc'),
  ]);

  final usersRes = results[0] as dynamic;
  final modulesRes = results[1] as dynamic;
  final analysesRes = results[2] as dynamic;
  final testsRes = results[3] as dynamic;
  final servicesRes = results[4] as dynamic;
  final rolesRes = results[5] as dynamic;
  final permsRes = results[6] as dynamic;

  final allUsers = (usersRes.content as List<User>);
  final recentLogins = allUsers
      .where((u) => u.lastLoginDate != null)
      .toList()
    ..sort((a, b) => (b.lastLoginDate ?? '').compareTo(a.lastLoginDate ?? ''));

  return DashboardStats(
    users: usersRes.totalElements,
    modules: modulesRes.totalElements,
    analyses: analysesRes.totalElements,
    tests: testsRes.totalElements,
    services: servicesRes.totalElements,
    roles: rolesRes.totalElements,
    permissions: permsRes.totalElements,
    recentModules: (modulesRes.content as List<Module>).take(5).toList(),
    recentAnalyses: (analysesRes.content as List<Analysis>).take(5).toList(),
    recentTests: (testsRes.content as List<TestItem>).take(5).toList(),
    recentLogins: recentLogins.take(5).toList(),
    allUsers: allUsers,
    allServices: (servicesRes.content as List<ServiceItem>),
    allModules: (modulesRes.content as List<Module>),
  );
});
