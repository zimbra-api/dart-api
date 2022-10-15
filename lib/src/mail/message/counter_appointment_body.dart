// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'counter_appointment_request.dart';
import 'counter_appointment_response.dart';

class CounterAppointmentBody extends SoapBody {
  CounterAppointmentBody({CounterAppointmentRequest? request, CounterAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory CounterAppointmentBody.fromJson(Map<String, dynamic> json) => CounterAppointmentBody(
      response: json['CounterAppointmentResponse'] != null
          ? CounterAppointmentResponse.fromJson(json['CounterAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CounterAppointmentRequest? get counterAppointmentRequest => request as CounterAppointmentRequest?;

  CounterAppointmentResponse? get counterAppointmentResponse => response as CounterAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CounterAppointmentRequest': request!.toJson(),
      };
}
