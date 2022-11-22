// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../type/cal_item_request_base.dart';
import 'modify_appointment_body.dart';
import 'modify_appointment_envelope.dart';

/// Modify an appointment, or if the appointment is a recurrence then modify the "default" invites.
/// That is, all instances that do not have exceptions.
/// If the appointment has a <recur>, then the following caveats are worth mentioning:
/// If any of: START, DURATION, END or RECUR change, then all exceptions are implicitly canceled!
class ModifyAppointmentRequest extends CalItemRequestBase {
  /// Invite ID of default invite
  final String? id;

  /// Component number of default component
  final int? componentNum;

  /// Changed sequence of fetched version.
  /// Used for conflict detection.
  /// By setting this, the request indicates which version of the appointment it is attempting to modify.
  /// If the appointment was updated on the server between the fetch and modify,
  /// an INVITE_OUT_OF_DATE exception will be thrown.
  final int? modifiedSequence;

  /// Revision
  final int? revision;

  ModifyAppointmentRequest(
      {this.id,
      this.componentNum,
      this.modifiedSequence,
      this.revision,
      super.echo,
      super.maxSize,
      super.wantHtml,
      super.neuter,
      super.forceSend,
      super.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyAppointmentEnvelope(ModifyAppointmentBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (id != null) 'id': id,
        if (componentNum != null) 'comp': componentNum,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (revision != null) 'rev': revision,
        if (echo != null) 'echo': echo,
        if (maxSize != null) 'max': maxSize,
        if (wantHtml != null) 'want': wantHtml,
        if (neuter != null) 'neuter': neuter,
        if (forceSend != null) 'forcesend': forceSend,
        if (msg != null) 'm': msg!.toMap(),
      };
}
