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

  factory ForwardAppointmentBody.fromMap(Map<String, dynamic> data) => ForwardAppointmentBody(
      response: data['ForwardAppointmentResponse'] != null
          ? ForwardAppointmentResponse.fromMap(data['ForwardAppointmentResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ForwardAppointmentRequest? get forwardAppointmentRequest => request as ForwardAppointmentRequest?;

  ForwardAppointmentResponse? get forwardAppointmentResponse => response as ForwardAppointmentResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ForwardAppointmentRequest': request!.toMap(),
      };
}
