// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'add_appointment_invite_request.dart';
import 'add_appointment_invite_response.dart';

class AddAppointmentInviteBody extends SoapBody {
  AddAppointmentInviteBody({AddAppointmentInviteRequest? request, AddAppointmentInviteResponse? response, super.fault})
      : super(request: request, response: response);

  factory AddAppointmentInviteBody.fromJson(Map<String, dynamic> json) => AddAppointmentInviteBody(
      response: json['AddAppointmentInviteResponse'] != null
          ? AddAppointmentInviteResponse.fromJson(json['AddAppointmentInviteResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AddAppointmentInviteRequest? get addAppointmentInviteRequest => request as AddAppointmentInviteRequest?;

  AddAppointmentInviteResponse? get addAppointmentInviteResponse => response as AddAppointmentInviteResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AddAppointmentInviteRequest': request!.toJson(),
      };
}
