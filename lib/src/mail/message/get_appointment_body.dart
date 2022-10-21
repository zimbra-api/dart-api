// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_appointment_request.dart';
import 'get_appointment_response.dart';

class GetAppointmentBody extends SoapBody {
  GetAppointmentBody({GetAppointmentRequest? request, GetAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetAppointmentBody.fromJson(Map<String, dynamic> json) => GetAppointmentBody(
      response: json['GetAppointmentResponse'] != null
          ? GetAppointmentResponse.fromJson(json['GetAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAppointmentRequest? get getAppointmentRequest => request as GetAppointmentRequest?;

  GetAppointmentResponse? get getAppointmentResponse => response as GetAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAppointmentRequest': request!.toJson(),
      };
}