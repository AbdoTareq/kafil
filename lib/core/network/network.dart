import 'package:dio/dio.dart';
import 'package:kafil/core/error/exceptions.dart';

import '../../export.dart';

const _baseUrl = 'https://test.kafiil.com/api/test/';

class Network {
  final Dio dio;
  final GetStorage box;
  Network({
    required this.dio,
    required this.box,
  });

  late Map<String, String?> headers;

  Future<Response> req(Future<Response> Function() requestType) async {
    headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Accept-Language': box.hasData(kLanguage) ? box.read(kLanguage) : 'ar',
    };
    if (box.hasData(kToken)) {
      headers = {
        ...headers,
        'Authorization': 'Bearer ${box.read(kToken)}',
      };
    }
    final response = await requestType();
    if (response.statusCode! > 210 || response.statusCode! < 200) {
      logger.i(response.data);
      throw ServerException(message: response.data.toString());
    }
    // success
    return response;
  }

  String _getParamsFromBody(dynamic body) {
    String params = '';
    for (var i = 0; i < body?.keys.length; i++) {
      params += '${List.from(body?.keys)[i]}=${List.from(body?.values)[i]}';
      if (i != body!.keys.length - 1) {
        params += '&';
      }
    }
    return params;
  }

  Future<Response> post(String endPoint, dynamic body,
      {bool isParamData = false, String? baseUrl}) async {
    return req(() {
      return dio.post(
          (baseUrl ?? _baseUrl) +
              endPoint +
              (isParamData ? _getParamsFromBody(body) : ''),
          data: isParamData ? {} : body,
          options: Options(headers: headers));
    });
  }

  Future<Response> patch(
    String endPoint,
    dynamic body,
  ) {
    return req(() {
      return dio.patch(_baseUrl + endPoint,
          data: body, options: Options(headers: headers));
    });
  }

  Future<Response> delete(
    String endPoint,
    dynamic body,
  ) {
    return req(() {
      return dio.delete(_baseUrl + endPoint,
          data: body, options: Options(headers: headers));
    });
  }

  Future<Response> get(String endPoint, dynamic body, {String? baseUrl}) {
    return req(() {
      return dio.get((baseUrl ?? _baseUrl) + endPoint,
          options: Options(headers: headers));
    });
  }

  downloadFileFromUrl(String url, String savePath) async {
    await dio.download(url, savePath, onReceiveProgress: (received, total) {});
    print("File is saved to download folder.");
  }
}
