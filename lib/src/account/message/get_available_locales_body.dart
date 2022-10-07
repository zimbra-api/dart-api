// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_available_locales_request.dart';
import 'get_available_locales_response.dart';

class GetAvailableLocalesBody extends SoapBody {
  GetAvailableLocalesBody({GetAvailableLocalesRequest? request, GetAvailableLocalesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetAvailableLocalesBody.fromJson(Map<String, dynamic> json) => GetAvailableLocalesBody(
      response: json['GetAvailableLocalesResponse'] != null
          ? GetAvailableLocalesResponse.fromJson(json['GetAvailableLocalesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAvailableLocalesRequest? get getAvailableLocalesRequest => request as GetAvailableLocalesRequest?;

  GetAvailableLocalesResponse? get getAvailableLocalesResponse => response as GetAvailableLocalesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAvailableLocalesRequest': request!.toJson(),
      };
}
