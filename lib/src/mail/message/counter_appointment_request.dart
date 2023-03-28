// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/msg.dart';
import 'counter_appointment_body.dart';
import 'counter_appointment_envelope.dart';

/// Propose a new time/location.  Sent by meeting attendee to organizer.
/// The syntax is very similar to CreateAppointmentRequest.
/// Should include an <inv> element which encodes an iCalendar COUNTER object
class CounterAppointmentRequest extends SoapRequest {
  /// Invite ID of default invite
  final String? id;

  /// Component number of default component
  final int? componentNum;

  /// Changed sequence of fetched version. Used for conflict detection.
  /// By setting this, the request indicates which version of the appointment it is attempting to propose.
  /// If the appointment was updated on the server between the fetch and modify, an INVITE_OUT_OF_DATE exception will be thrown.
  final int? modifiedSequence;

  /// Revision
  final int? revision;

  /// Details of counter proposal.
  final Msg? msg;

  CounterAppointmentRequest({
    this.id,
    this.componentNum,
    this.modifiedSequence,
    this.revision,
    this.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CounterAppointmentEnvelope(
        CounterAppointmentBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (componentNum != null) 'comp': componentNum,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (revision != null) 'rev': revision,
        if (msg != null) 'm': msg!.toMap(),
      };
}
