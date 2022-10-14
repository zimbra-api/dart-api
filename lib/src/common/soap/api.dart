// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert';

import 'package:zimbra_api/src/common/soap/client.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

abstract class Api {
  final Client _soapClient;

  SoapHeader? _requestHeader;

  Api(String serviceHost) : _soapClient = Client(serviceHost);

  Future<Map<String, dynamic>> invoke(SoapRequest request) {
    return _soapClient
        .sendRequest(jsonEncode(request.getEnvelope(header: _requestHeader).toJson()))
        .then((response) => jsonDecode(response.body).cast<Map<String, dynamic>>());
  }
}
