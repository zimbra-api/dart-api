// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'add_appointment_invite_request.dart';
import 'add_appointment_invite_response.dart';

class AddAppointmentInviteBody extends SoapBody {
  AddAppointmentInviteBody({
    AddAppointmentInviteRequest? request,
    AddAppointmentInviteResponse? response,
  }) : super(request: request, response: response);

  factory AddAppointmentInviteBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      AddAppointmentInviteBody(
        response: data['AddAppointmentInviteResponse'] != null
            ? AddAppointmentInviteResponse.fromMap(data['AddAppointmentInviteResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddAppointmentInviteRequest': request!.toMap(),
      };
}
