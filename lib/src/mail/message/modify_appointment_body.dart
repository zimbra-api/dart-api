// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_appointment_request.dart';
import 'modify_appointment_response.dart';

class ModifyAppointmentBody extends SoapBody {
  ModifyAppointmentBody({ModifyAppointmentRequest? request, ModifyAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyAppointmentBody.fromJson(Map<String, dynamic> json) => ModifyAppointmentBody(
      response: json['ModifyAppointmentResponse'] != null
          ? ModifyAppointmentResponse.fromJson(json['ModifyAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyAppointmentRequest? get modifyAppointmentRequest => request as ModifyAppointmentRequest?;

  ModifyAppointmentResponse? get modifyAppointmentResponse => response as ModifyAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyAppointmentRequest': request!.toJson(),
      };
}
