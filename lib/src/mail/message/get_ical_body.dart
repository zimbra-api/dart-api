// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_ical_request.dart';
import 'get_ical_response.dart';

class GetICalBody extends SoapBody {
  GetICalBody({GetICalRequest? request, GetICalResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetICalBody.fromJson(Map<String, dynamic> json) => GetICalBody(
      response: json['GetICalResponse'] != null ? GetICalResponse.fromJson(json['GetICalResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetICalRequest? get getICalRequest => request as GetICalRequest?;

  GetICalResponse? get getICalResponse => response as GetICalResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetICalRequest': request!.toJson(),
      };
}
