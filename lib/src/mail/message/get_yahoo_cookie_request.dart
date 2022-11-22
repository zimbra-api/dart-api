// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'get_yahoo_cookie_body.dart';
import 'get_yahoo_cookie_envelope.dart';

/// Get Yahoo cookie
class GetYahooCookieRequest extends SoapRequest {
  final String user;

  GetYahooCookieRequest(this.user);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetYahooCookieEnvelope(GetYahooCookieBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'user': user,
      };
}
