import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/network/dio_client.dart';
import 'package:may_mobile/features/services/data/service_repository.dart';
import 'package:may_mobile/features/services/domain/service_model.dart';
import 'package:may_mobile/shared/models/page_response.dart';

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  return ServiceRepository(dio: ref.watch(dioProvider));
});

final servicesProvider =
    StateNotifierProvider<ServicesNotifier, AsyncValue<PageResponse<ServiceItem>>>((ref) {
  return ServicesNotifier(ref.watch(serviceRepositoryProvider));
});

class ServicesNotifier extends StateNotifier<AsyncValue<PageResponse<ServiceItem>>> {
  final ServiceRepository _repository;
  int _page = 0;
  final int _size = 10;
  Map<String, String> _filters = {};

  ServicesNotifier(this._repository) : super(const AsyncValue.loading()) {
    fetchServices();
  }

  Future<void> fetchServices() async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getServices(
        page: _page,
        size: _size,
        sort: 'name,asc',
        name: _filters['name'],
        city: _filters['city'],
        status: _filters['status'],
      );
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> setPage(int page) async {
    _page = page;
    await fetchServices();
  }

  Future<void> setFilters(Map<String, String> filters) async {
    _filters = filters;
    _page = 0;
    await fetchServices();
  }

  Future<void> clearFilters() async {
    _filters = {};
    _page = 0;
    await fetchServices();
  }

  Future<void> createService(CreateServiceRequest request) async {
    await _repository.createService(request);
    await fetchServices();
  }

  Future<void> updateService(int id, UpdateServiceRequest request) async {
    await _repository.updateService(id, request);
    await fetchServices();
  }

  Future<void> deleteService(int id) async {
    await _repository.deleteService(id);
    await fetchServices();
  }
}
