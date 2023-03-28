// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/participation_status.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/msg.dart';
import 'add_appointment_invite_body.dart';
import 'add_appointment_invite_envelope.dart';

/// Add an invite to an appointment.
/// The invite corresponds to a VEVENT component.
/// Based on the UID specified (required), a new appointment is created in the default calendar if necessary.
/// If an appointment with the same UID exists, the appointment is updated with the new invite only if the invite is not outdated,
/// according to the iCalendar sequencing rule (based on SEQUENCE,RECURRENCE-ID and DTSTAMP).
class AddAppointmentInviteRequest extends SoapRequest {
  /// iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// Message
  final Msg msg;

  AddAppointmentInviteRequest(this.msg, {this.partStat});

  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      AddAppointmentInviteEnvelope(
        AddAppointmentInviteBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (partStat != null) 'ptst': partStat!.name,
        'm': msg.toMap(),
      };
}
