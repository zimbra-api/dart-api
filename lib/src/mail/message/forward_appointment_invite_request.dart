// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/msg.dart';

import 'forward_appointment_invite_body.dart';
import 'forward_appointment_invite_envelope.dart';

/// Used by an attendee to forward an appointment invite email to another user who is not already an attendee.
/// To forward an appointment item, use ForwardAppointmentRequest instead.
class ForwardAppointmentInviteRequest extends SoapRequest {
  /// Invite message item ID
  final String? id;

  /// Details of the invite
  final Msg? msg;

  ForwardAppointmentInviteRequest({this.id, this.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ForwardAppointmentInviteEnvelope(ForwardAppointmentInviteBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (msg != null) 'm': msg!.toJson(),
      };
}
