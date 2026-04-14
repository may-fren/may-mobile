import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/tests/data/test_repository.dart';
import 'package:may_mobile/features/tests/domain/test_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

final testRepositoryProvider = Provider<TestRepository>((ref) {
  return TestRepository(dio: ref.watch(dioProvider));
});

final testsProvider =
    StateNotifierProvider<TestsNotifier, AsyncValue<PageResponse<TestItem>>>((ref) {
  return TestsNotifier(ref.watch(testRepositoryProvider));
});

class TestsNotifier extends StateNotifier<AsyncValue<PageResponse<TestItem>>> {
  final TestRepository _repository;
  int _page = 0;
  final int _size = 10;
  Map<String, String> _filters = {};

  TestsNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchTests();
  }

  Future<void> fetchTests() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getTests(
        page: _page,
        size: _size,
        sort: 'name,asc',
        name: _filters['name'],
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchTests();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchTests();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchTests();
  }

  Future<void> createTest(CreateTestRequest request) async {
    await _repository.createTest(request);
    await fetchTests();
  }

  Future<void> updateTest(int id, UpdateTestRequest request) async {
    await _repository.updateTest(id, request);
    await fetchTests();
  }

  Future<void> deleteTest(int id) async {
    await _repository.deleteTest(id);
    await fetchTests();
  }
}
