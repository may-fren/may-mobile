import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/analyses/data/analysis_repository.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

final analysisRepositoryProvider = Provider<AnalysisRepository>((ref) {
  return AnalysisRepository(dio: ref.watch(dioProvider));
});

final analysesProvider =
    StateNotifierProvider<AnalysesNotifier, AsyncValue<PageResponse<Analysis>>>((ref) {
  return AnalysesNotifier(ref.watch(analysisRepositoryProvider));
});

class AnalysesNotifier extends StateNotifier<AsyncValue<PageResponse<Analysis>>> {
  final AnalysisRepository _repository;
  int _page = 0;
  final int _size = 10;
  Map<String, String> _filters = {};

  AnalysesNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchAnalyses();
  }

  Future<void> fetchAnalyses() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getAnalyses(
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
    await fetchAnalyses();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchAnalyses();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchAnalyses();
  }

  Future<void> createAnalysis(CreateAnalysisRequest request) async {
    await _repository.createAnalysis(request);
    await fetchAnalyses();
  }

  Future<void> updateAnalysis(int id, UpdateAnalysisRequest request) async {
    await _repository.updateAnalysis(id, request);
    await fetchAnalyses();
  }

  Future<void> deleteAnalysis(int id) async {
    await _repository.deleteAnalysis(id);
    await fetchAnalyses();
  }
}
