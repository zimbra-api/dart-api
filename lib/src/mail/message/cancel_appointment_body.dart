// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'cancel_appointment_request.dart';
import 'cancel_appointment_response.dart';

class CancelAppointmentBody extends SoapBody {
  CancelAppointmentBody({CancelAppointmentRequest? request, CancelAppointmentResponse? response})
      : super(request: request, response: response);

  factory CancelAppointmentBody.fromMap(Map<String, dynamic> data) => CancelAppointmentBody(
      response: data['CancelAppointmentResponse'] != null
          ? CancelAppointmentResponse.fromMap(data['CancelAppointmentResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CancelAppointmentRequest': request!.toMap(),
      };
}
