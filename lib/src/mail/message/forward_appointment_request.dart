// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/cal_tz_info.dart';
import '../type/dt_time_info.dart';
import '../type/msg.dart';
import 'forward_appointment_body.dart';
import 'forward_appointment_envelope.dart';

/// Used by an attendee to forward an instance or entire appointment to another user who is not already an attendee.
class ForwardAppointmentRequest extends SoapRequest {
  /// Appointment item ID
  final String? id;

  /// RECURRENCE-ID information if forwarding a single instance of a recurring appointment
  final DtTimeInfo? exceptionId;

  /// Definition for TZID referenced by DATETIME in <exceptId>
  final CalTZInfo? timezone;

  /// Details of the appointment
  final Msg? msg;

  ForwardAppointmentRequest({
    this.id,
    this.exceptionId,
    this.timezone,
    this.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ForwardAppointmentEnvelope(
        ForwardAppointmentBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (exceptionId != null) 'exceptId': exceptionId!.toMap(),
        if (timezone != null) 'tz': timezone!.toMap(),
        if (msg != null) 'm': msg!.toMap(),
      };
}
