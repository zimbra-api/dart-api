// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'forward_appointment_invite_request.dart';
import 'forward_appointment_invite_response.dart';

class ForwardAppointmentInviteBody extends SoapBody {
  ForwardAppointmentInviteBody(
      {ForwardAppointmentInviteRequest? request, ForwardAppointmentInviteResponse? response, super.fault})
      : super(request: request, response: response);

  factory ForwardAppointmentInviteBody.fromMap(Map<String, dynamic> data) => ForwardAppointmentInviteBody(
      response: data['ForwardAppointmentInviteResponse'] != null
          ? ForwardAppointmentInviteResponse.fromMap(data['ForwardAppointmentInviteResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ForwardAppointmentInviteRequest? get forwardAppointmentInviteRequest => request as ForwardAppointmentInviteRequest?;

  ForwardAppointmentInviteResponse? get forwardAppointmentInviteResponse =>
      response as ForwardAppointmentInviteResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ForwardAppointmentInviteRequest': request!.toMap(),
      };
}
