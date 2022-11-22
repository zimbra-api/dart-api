// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/cal_tz_info.dart';
import '../type/instance_recur_id_info.dart';
import '../type/msg.dart';
import 'cancel_appointment_body.dart';
import 'cancel_appointment_envelope.dart';

/// Cancel appointment
/// NOTE: If canceling an exception, the original instance (ie the one the exception was "excepting") WILL NOT be
/// restored when you cancel this exception.
class CancelAppointmentRequest extends SoapRequest {
  /// ID of default invite
  final String? id;

  /// Component number of default invite
  final int? componentNum;

  /// Modified sequence
  final int? modifiedSequence;

  /// Revision
  final int? revision;

  /// Instance recurrence ID information
  final InstanceRecurIdInfo? instance;

  /// Definition for TZID referenced by DATETIME in instance
  final CalTZInfo? timezone;

  /// Message
  final Msg? msg;

  CancelAppointmentRequest({
    this.id,
    this.componentNum,
    this.modifiedSequence,
    this.revision,
    this.instance,
    this.timezone,
    this.msg,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CancelAppointmentEnvelope(CancelAppointmentBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (componentNum != null) 'comp': componentNum,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (revision != null) 'rev': revision,
        if (instance != null) 'inst': instance!.toMap(),
        if (timezone != null) 'tz': timezone!.toMap(),
        if (msg != null) 'm': msg!.toMap(),
      };
}
