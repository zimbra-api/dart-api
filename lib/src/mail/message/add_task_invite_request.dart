// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/msg.dart';

import 'add_task_invite_body.dart';
import 'add_task_invite_envelope.dart';

/// Add a task invite
class AddTaskInviteRequest extends SoapRequest {
  /// iCalendar PTST (Participation status)
  /// Valid values: NE|AC|TE|DE|DG|CO|IN|WE|DF
  /// Meanings:
  /// "NE"eds-action, "TE"ntative, "AC"cept, "DE"clined, "DG" (delegated), "CO"mpleted (todo), "IN"-process (todo),
  /// "WA"iting (custom value only for todo), "DF" (deferred; custom value only for todo)
  final ParticipationStatus? partStat;

  /// Message
  final Msg? msg;

  AddTaskInviteRequest({this.partStat, this.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      AddTaskInviteEnvelope(AddTaskInviteBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (partStat != null) 'ptst': partStat!.name,
        if (msg != null) 'm': msg!.toJson(),
      };
}
