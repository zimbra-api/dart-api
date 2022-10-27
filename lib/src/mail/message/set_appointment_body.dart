// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_appointment_request.dart';
import 'set_appointment_response.dart';

class SetAppointmentBody extends SoapBody {
  SetAppointmentBody({SetAppointmentRequest? request, SetAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetAppointmentBody.fromJson(Map<String, dynamic> json) => SetAppointmentBody(
      response: json['SetAppointmentResponse'] != null
          ? SetAppointmentResponse.fromJson(json['SetAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SetAppointmentRequest? get setAppointmentRequest => request as SetAppointmentRequest?;

  SetAppointmentResponse? get setAppointmentResponse => response as SetAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SetAppointmentRequest': request!.toJson(),
      };
}
