// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_working_hours_request.dart';
import 'get_working_hours_response.dart';

class GetWorkingHoursBody extends SoapBody {
  GetWorkingHoursBody({GetWorkingHoursRequest? request, GetWorkingHoursResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetWorkingHoursBody.fromJson(Map<String, dynamic> json) => GetWorkingHoursBody(
      response: json['GetWorkingHoursResponse'] != null
          ? GetWorkingHoursResponse.fromJson(json['GetWorkingHoursResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetWorkingHoursRequest? get getWorkingHoursRequest => request as GetWorkingHoursRequest?;

  GetWorkingHoursResponse? get getWorkingHoursResponse => response as GetWorkingHoursResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetWorkingHoursRequest': request!.toJson(),
      };
}