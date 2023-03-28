// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'attachment.dart';
import 'request.dart';

class Client {
  static const userAgent = 'Dart Upload Client';
  static const servicePath = '/service/upload';
  static const queryFormat = 'raw,extended';

  /// `multipart/form-data` http request.
  final http.MultipartRequest multipartRequest;

  Client(String serviceHost)
      : multipartRequest = http.MultipartRequest(
          'POST',
          Uri.https(
            serviceHost,
            servicePath,
            {'fmt': queryFormat},
          ),
        );

  Future<List<Attachment>> upload(Request request) {
    multipartRequest
      ..headers['user-agent'] = userAgent
      ..headers['cookie'] = request.authTokenCookie
      ..fields['requestId'] = request.requestId
      ..files.addAll(request.files);
    return multipartRequest.send().then((stream) {
      return http.Response.fromStream(stream).then(
        (response) => _parseResponse(response),
      );
    });
  }

  List<Attachment> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map<Attachment>(
            (data) => Attachment.fromMap(data),
          )
          .toList(growable: false);
    } else {
      throw http.ClientException(
        'An error is encountered with status code ${response.statusCode}',
        response.request?.url,
      );
    }
  }

  static List<dynamic> jsonDecode(String content) {
    final exp = RegExp(r'\[\{(.*)\}\]');
    final match = exp.firstMatch(content);
    return convert.jsonDecode(match?.group(0) ?? '[]');
  }
}
