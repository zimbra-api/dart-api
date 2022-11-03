// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_yahoo_auth_token_request.dart';
import 'get_yahoo_auth_token_response.dart';

class GetYahooAuthTokenBody extends SoapBody {
  GetYahooAuthTokenBody({GetYahooAuthTokenRequest? request, GetYahooAuthTokenResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetYahooAuthTokenBody.fromMap(Map<String, dynamic> data) => GetYahooAuthTokenBody(
      response: data['GetYahooAuthTokenResponse'] != null
          ? GetYahooAuthTokenResponse.fromMap(data['GetYahooAuthTokenResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetYahooAuthTokenRequest? get getYahooAuthTokenRequest => request as GetYahooAuthTokenRequest?;

  GetYahooAuthTokenResponse? get getYahooAuthTokenResponse => response as GetYahooAuthTokenResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetYahooAuthTokenRequest': request!.toMap(),
      };
}
