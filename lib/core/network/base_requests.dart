import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafil/core/network/network.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';
import 'network_info.dart';
import 'server_response.dart';

class BaseRequests {
  final NetworkInfo networkInfo;
  final Network network;

  BaseRequests({required this.networkInfo, required this.network});
  Future<Either<Failure, ServerResponse>> get(
    String endPoint,
    dynamic body,
  ) async =>
      _handleNetworkError(() => network.get(endPoint, body));

  Future<Either<Failure, ServerResponse>> post(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.post(endPoint, body));

  Future<Either<Failure, ServerResponse>> patch(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.patch(endPoint, body));

  Future<Either<Failure, ServerResponse>> delete(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.delete(endPoint, body));

  Future<Either<Failure, ServerResponse>> _handleNetworkError(
      Future<Response> Function() request) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await request();
        return Right(ServerResponse(data: res.data));
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
