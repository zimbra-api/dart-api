// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/msg.dart';
import 'decline_counter_appointment_body.dart';
import 'decline_counter_appointment_envelope.dart';

/// Decline a change proposal from an attendee.
/// Sent by organizer to an attendee who has previously sent a COUNTER message.
/// The syntax of the request is very similar to CreateAppointmentRequest.
class DeclineCounterAppointmentRequest extends SoapRequest {
  /// Details of the Decline Counter.
  /// Should have an <inv> which encodes an iCalendar DECLINECOUNTER object
  final Msg? msg;

  DeclineCounterAppointmentRequest({this.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DeclineCounterAppointmentEnvelope(DeclineCounterAppointmentBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (msg != null) 'm': msg!.toMap(),
      };
}
