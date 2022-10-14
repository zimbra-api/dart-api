// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'dart:convert';

import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/soap/client.dart';
import 'package:zimbra_api/src/common/type/header/account_info.dart';
import 'package:zimbra_api/src/common/type/header/context.dart';
import 'package:zimbra_api/src/common/type/header/format_info.dart';
import 'package:zimbra_api/src/common/type/header/session_info.dart';
import 'package:zimbra_api/src/common/type/header/user_agent_info.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

abstract class Api {
  final Client _soapClient;

  String? _authToken;

  String? _targetAccount;

  String? _sessionId;

  String? _userAgentName;

  String? _userAgentVersion;

  Api(String serviceHost) : _soapClient = Client(serviceHost);

  Future<Map<String, dynamic>> invoke(SoapRequest request) {
    return _soapClient
        .sendRequest(jsonEncode(request
            .getEnvelope(
              header: SoapHeader(
                context: Context(
                  authToken: _authToken,
                  account: _targetAccount != null ? AccountInfo(AcccountBy.name, _targetAccount!) : null,
                  session: _sessionId != null ? SessionInfo(sessionId: _sessionId, value: _sessionId) : null,
                  userAgent: (_userAgentName != null || _userAgentVersion != null)
                      ? UserAgentInfo(name: _userAgentName, version: _userAgentVersion)
                      : null,
                  format: FormatInfo(),
                ),
              ),
            )
            .toJson()))
        .then((response) => jsonDecode(response.body).cast<Map<String, dynamic>>());
  }

  void setAuthToken(String authToken) {
    _authToken = authToken;
  }

  void setTargetAccount(String account) {
    _targetAccount = account;
  }

  void setSession(String sessionId) {
    _sessionId = sessionId;
  }

  void setUserAgent(String name, {String? version}) {
    _userAgentName = name;
    _userAgentVersion = version;
  }
}
