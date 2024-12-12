import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetDateCall {
  static Future<ApiCallResponse> call({
    String? johnson = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetDate',
      apiUrl:
          'https://timeapi.io/api/time/current/zone?timeZone=America%2FNew_York',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'parameter': "johnson",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? dayOfWeekAPI(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.dayOfWeek''',
      ));
  static String? dateAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date''',
      ));
}

class GetWeatherBetterCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeatherBetter',
      apiUrl:
          'https://api.open-meteo.com/v1/forecast?latitude=41.4862&longitude=-71.5307&current_weather=true&temperature_unit=fahrenheit',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? weatherTemp(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.current_weather.temperature''',
      ));
  static int? weatherCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current_weather.weathercode''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
