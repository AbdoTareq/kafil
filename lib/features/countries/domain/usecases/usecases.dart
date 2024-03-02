import 'package:kafil/core/feature/data/models/countries_wrapper.dart';
import 'package:kafil/core/feature/domain/repositories/repositories.dart';

import '../../../../export.dart';

class CountriesUseCase {
  final Repository repository;

  CountriesUseCase({required this.repository});

  Future<Either<Failure, CountriesWrapper>> getCountries(int page) async {
    return (repository.get('country?page=$page')).then((value) => value.map(
        (r) => r == null ? CountriesWrapper() : CountriesWrapper.fromJson(r)));
  }
}
