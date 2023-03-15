import 'package:authentication_repository/authentication_repository.dart';
import 'package:preference_storage/preference_storage.dart';
import 'package:services_api/services_api.dart';

class NaturesRepository {
  final ServicesApi _servicesApi;
  final AuthenticationRepository _authenticationRepository;
  final Preferences _prefs;

  NaturesRepository(
    this._authenticationRepository,
    this._prefs, {
    ServicesApi? servicesApi,
  }) : _servicesApi = servicesApi ?? ServicesApi(_prefs);

  Future<ResponseDataNatures> getdataNaturesIndex() async {
    try {
      final data = await _servicesApi.dataNaturesIndex();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<DataNatures> dataNaturesCreate({
    required Map<String, dynamic> data,
  }) async {
    try {
      final result = await _servicesApi.dataNaturesCreate(
        data: data,
      );
      return result;
    } catch (e) {
      _authenticationRepository.unauthenticated();
      rethrow;
    }
  }
}
