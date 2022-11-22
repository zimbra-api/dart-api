// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_yahoo_auth_token_request.dart';
import 'get_yahoo_auth_token_response.dart';

class GetYahooAuthTokenBody extends SoapBody {
  GetYahooAuthTokenBody({GetYahooAuthTokenRequest? request, GetYahooAuthTokenResponse? response})
      : super(request: request, response: response);

  factory GetYahooAuthTokenBody.fromMap(Map<String, dynamic> data) => GetYahooAuthTokenBody(
      response: data['GetYahooAuthTokenResponse'] != null
          ? GetYahooAuthTokenResponse.fromMap(data['GetYahooAuthTokenResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetYahooAuthTokenRequest': request!.toMap(),
      };
}
