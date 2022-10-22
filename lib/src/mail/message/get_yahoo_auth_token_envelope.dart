// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_yahoo_auth_token_body.dart';

class GetYahooAuthTokenEnvelope extends SoapEnvelope {
  GetYahooAuthTokenEnvelope(GetYahooAuthTokenBody body, {super.header}) : super(body);

  factory GetYahooAuthTokenEnvelope.fromJson(Map<String, dynamic> json) =>
      GetYahooAuthTokenEnvelope(GetYahooAuthTokenBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetYahooAuthTokenBody get getYahooAuthTokenBody => body as GetYahooAuthTokenBody;
}
