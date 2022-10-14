// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'cancel_appointment_request.dart';
import 'cancel_appointment_response.dart';

class CancelAppointmentBody extends SoapBody {
  CancelAppointmentBody({CancelAppointmentRequest? request, CancelAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory CancelAppointmentBody.fromJson(Map<String, dynamic> json) => CancelAppointmentBody(
      response: json['CancelAppointmentResponse'] != null
          ? CancelAppointmentResponse.fromJson(json['CancelAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CancelAppointmentRequest? get cancelAppointmentRequest => request as CancelAppointmentRequest?;

  CancelAppointmentResponse? get cancelAppointmentResponse => response as CancelAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CancelAppointmentRequest': request!.toJson(),
      };
}
