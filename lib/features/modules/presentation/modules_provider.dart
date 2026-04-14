import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/modules/data/module_repository.dart';
import 'package:may_mobile/features/modules/domain/module_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

final moduleRepositoryProvider = Provider<ModuleRepository>((ref) {
  return ModuleRepository(dio: ref.watch(dioProvider));
});

final modulesProvider =
    StateNotifierProvider<ModulesNotifier, AsyncValue<PageResponse<Module>>>((ref) {
  return ModulesNotifier(ref.watch(moduleRepositoryProvider));
});

final allModulesProvider = FutureProvider<List<Module>>((ref) async {
  final repo = ref.watch(moduleRepositoryProvider);
  final result = await repo.getModules(page: 0, size: 1000);
  return result.content;
});

class ModulesNotifier extends StateNotifier<AsyncValue<PageResponse<Module>>> {
  final ModuleRepository _repository;
  int _page = 0;
  final int _size = 10;
  Map<String, String> _filters = {};

  ModulesNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchModules();
  }

  Future<void> fetchModules() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getModules(
        page: _page,
        size: _size,
        sort: 'name,asc',
        name: _filters['name'],
        brand: _filters['brand'],
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchModules();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchModules();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchModules();
  }

  Future<void> createModule(CreateModuleRequest request) async {
    await _repository.createModule(request);
    await fetchModules();
  }

  Future<void> updateModule(int id, UpdateModuleRequest request) async {
    await _repository.updateModule(id, request);
    await fetchModules();
  }

  Future<void> deleteModule(int id) async {
    await _repository.deleteModule(id);
    await fetchModules();
  }
}
