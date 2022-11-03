// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_yahoo_auth_token_body.dart';
import 'get_yahoo_auth_token_envelope.dart';

/// Get Yahoo Auth Token
class GetYahooAuthTokenRequest extends SoapRequest {
  final String user;

  final String password;

  GetYahooAuthTokenRequest(this.user, this.password);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetYahooAuthTokenEnvelope(GetYahooAuthTokenBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'user': user,
        'password': password,
      };
}
