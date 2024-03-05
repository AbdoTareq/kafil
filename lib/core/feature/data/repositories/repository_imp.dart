import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kafil/core/error/failures.dart';
import 'package:kafil/core/network/base_requests.dart';

import '../../domain/repositories/repositories.dart';

class RepoImp implements Repository {
  final BaseRequests remoteDataSource;

  RepoImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, dynamic>?>> get(String endPoint,
      {Map? data}) async {
    final res = await remoteDataSource.get(endPoint, data);
    return res.fold(
      (failure) => left(failure),
      (serverResponse) {
        return right(serverResponse.data);
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> post(
      String endPoint, Map? data) async {
    final res = await remoteDataSource.post(endPoint, data);
    return res.fold(
      (failure) => left(failure),
      (serverResponse) {
        return right(serverResponse.data);
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> uploadImage(
      String endPoint, Map? data, File file) async {
    final res = await remoteDataSource.uploadImage(endPoint, data, file);
    return res.fold(
      (failure) => left(failure),
      (serverResponse) {
        return right(serverResponse.data);
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> update(
      String endPoint, Map? data) async {
    final res = await remoteDataSource.patch(endPoint, data);
    return res.fold(
      (failure) => left(failure),
      (serverResponse) {
        return right(serverResponse.data);
      },
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> delete(
      String endPoint, Map? data) async {
    final res = await remoteDataSource.delete(endPoint, data);
    return res.fold(
      (failure) => left(failure),
      (serverResponse) {
        return right(serverResponse.data);
      },
    );
  }
}
