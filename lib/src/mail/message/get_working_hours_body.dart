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

  factory GetWorkingHoursBody.fromMap(Map<String, dynamic> data) => GetWorkingHoursBody(
      response: data['GetWorkingHoursResponse'] != null
          ? GetWorkingHoursResponse.fromMap(data['GetWorkingHoursResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetWorkingHoursRequest': request!.toMap(),
      };
}
