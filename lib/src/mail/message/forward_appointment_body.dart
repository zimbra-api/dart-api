// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'forward_appointment_request.dart';
import 'forward_appointment_response.dart';

class ForwardAppointmentBody extends SoapBody {
  ForwardAppointmentBody({ForwardAppointmentRequest? request, ForwardAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory ForwardAppointmentBody.fromJson(Map<String, dynamic> json) => ForwardAppointmentBody(
      response: json['ForwardAppointmentResponse'] != null
          ? ForwardAppointmentResponse.fromJson(json['ForwardAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ForwardAppointmentRequest? get forwardAppointmentRequest => request as ForwardAppointmentRequest?;

  ForwardAppointmentResponse? get forwardAppointmentResponse => response as ForwardAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ForwardAppointmentRequest': request!.toJson(),
      };
}
