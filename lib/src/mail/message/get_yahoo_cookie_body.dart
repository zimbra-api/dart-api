// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_yahoo_cookie_request.dart';
import 'get_yahoo_cookie_response.dart';

class GetYahooCookieBody extends SoapBody {
  GetYahooCookieBody({GetYahooCookieRequest? request, GetYahooCookieResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetYahooCookieBody.fromMap(Map<String, dynamic> data) => GetYahooCookieBody(
      response: data['GetYahooCookieResponse'] != null
          ? GetYahooCookieResponse.fromMap(data['GetYahooCookieResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetYahooCookieRequest': request!.toMap(),
      };
}
