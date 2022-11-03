// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'forward_appointment_invite_body.dart';

class ForwardAppointmentInviteEnvelope extends SoapEnvelope {
  ForwardAppointmentInviteEnvelope(ForwardAppointmentInviteBody body, {super.header}) : super(body);

  factory ForwardAppointmentInviteEnvelope.fromMap(Map<String, dynamic> data) =>
      ForwardAppointmentInviteEnvelope(ForwardAppointmentInviteBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ForwardAppointmentInviteBody get forwardAppointmentInviteBody => body as ForwardAppointmentInviteBody;
}
