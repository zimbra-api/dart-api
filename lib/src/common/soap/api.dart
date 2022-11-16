// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/header/account_info.dart';
import 'package:zimbra_api/src/common/type/header/context.dart';
import 'package:zimbra_api/src/common/type/header/format_info.dart';
import 'package:zimbra_api/src/common/type/header/session_info.dart';
import 'package:zimbra_api/src/common/type/header/user_agent_info.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

import 'client.dart';
import 'client_exception.dart';

typedef FromMapConverter<T extends SoapResponse> = T? Function(Map<String, dynamic> data);

abstract class Api {
  final Client _soapClient;

  final String? authToken;

  final String? targetAccount;

  final String? sessionId;

  final String? userAgentName;

  final String? userAgentVersion;

  Api(
    final String serviceHost, {
    final HttpClientFactory? httpClientFactory,
    this.authToken,
    this.targetAccount,
    this.sessionId,
    this.userAgentName,
    this.userAgentVersion,
  }) : _soapClient = Client(serviceHost, httpClientFactory: httpClientFactory);

  Future<T?> invoke<T extends SoapResponse>(final SoapRequest request, {required final FromMapConverter<T> fromMap}) {
    return _soapClient
        .sendRequest(request
            .getEnvelope(
              header: SoapHeader(
                context: Context(
                  authToken: authToken,
                  account: targetAccount != null ? AccountInfo(AccountBy.name, targetAccount!) : null,
                  session: sessionId != null ? SessionInfo(sessionId: sessionId, value: sessionId) : null,
                  userAgent: (userAgentName != null || userAgentVersion != null)
                      ? UserAgentInfo(name: userAgentName, version: userAgentVersion)
                      : null,
                  format: FormatInfo(),
                ),
              ),
            )
            .toJson())
        .onError<ClientException>((e, _) => throw SoapFault.fromMap(e.response.mapData['Body']?['Fault'] ?? {}))
        .then((response) => fromMap(response.mapData));
  }

  void close() {
    _soapClient.close();
  }
}
