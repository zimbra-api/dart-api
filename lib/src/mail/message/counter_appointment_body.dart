// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'counter_appointment_request.dart';
import 'counter_appointment_response.dart';

class CounterAppointmentBody extends SoapBody {
  CounterAppointmentBody({CounterAppointmentRequest? request, CounterAppointmentResponse? response})
      : super(request: request, response: response);

  factory CounterAppointmentBody.fromMap(Map<String, dynamic> data) => CounterAppointmentBody(
      response: data['CounterAppointmentResponse'] != null
          ? CounterAppointmentResponse.fromMap(data['CounterAppointmentResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CounterAppointmentRequest': request!.toMap(),
      };
}
