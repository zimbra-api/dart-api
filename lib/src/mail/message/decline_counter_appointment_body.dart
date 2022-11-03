// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'decline_counter_appointment_request.dart';
import 'decline_counter_appointment_response.dart';

class DeclineCounterAppointmentBody extends SoapBody {
  DeclineCounterAppointmentBody(
      {DeclineCounterAppointmentRequest? request, DeclineCounterAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory DeclineCounterAppointmentBody.fromMap(Map<String, dynamic> data) => DeclineCounterAppointmentBody(
      response: data['DeclineCounterAppointmentResponse'] != null
          ? DeclineCounterAppointmentResponse.fromMap(data['DeclineCounterAppointmentResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  DeclineCounterAppointmentRequest? get declineCounterAppointmentRequest =>
      request as DeclineCounterAppointmentRequest?;

  DeclineCounterAppointmentResponse? get declineCounterAppointmentResponse =>
      response as DeclineCounterAppointmentResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DeclineCounterAppointmentRequest': request!.toMap(),
      };
}
