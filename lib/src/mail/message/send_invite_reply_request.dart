// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/verb_type.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/cal_tz_info.dart';
import 'package:zimbra_api/src/mail/type/dt_time_info.dart';
import 'package:zimbra_api/src/mail/type/msg.dart';

import 'send_invite_reply_body.dart';
import 'send_invite_reply_envelope.dart';

/// Send a reply to an invite
class SendInviteReplyRequest extends SoapRequest {
  /// Unique ID of the invite (and component therein) you are replying to
  final String id;

  /// Component number of the invite
  final int componentNum;

  /// Verb - ACCEPT, DECLINE, TENTATIVE, COMPLETED, DELEGATED
  /// (Completed/Delegated are NOT supported as of 9/12/2005)
  final VerbType? verb;

  /// Update organizer. true by default. if false then only make the update locally.
  /// Note that earlier documentation implied incorrectly that if this was false it would be ignored and treated
  /// as being true if an <m> element is present.
  /// Also take a note that, if RSVP setting in original invite is not present or FALSE then updateOrganizer will be treated as FALSE.
  final bool? updateOrganizer;

  /// Identity ID to use to send reply
  final String? identityId;

  /// If supplied then reply to just one instance of the specified Invite (default is all instances)
  final DtTimeInfo? exceptionId;

  /// Definition for TZID referenced by DATETIME in <exceptId>
  final CalTZInfo? timezone;

  /// Embedded message, if the user wants to send a custom update message.
  /// The client is responsible for setting the message recipient list in this case (which should include Organizer,
  /// if the client wants to tell the organizer about this response)
  final Msg? msg;

  SendInviteReplyRequest(this.id, this.componentNum,
      {this.verb, this.updateOrganizer, this.identityId, this.exceptionId, this.timezone, this.msg});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SendInviteReplyEnvelope(SendInviteReplyBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
        'comp': componentNum,
        if (verb != null) 'verb': verb!.name,
        if (updateOrganizer != null) 'updateOrganizer': updateOrganizer,
        if (identityId != null) 'idnt': identityId,
        if (exceptionId != null) 'exceptId': exceptionId!.toMap(),
        if (timezone != null) 'tz': timezone!.toMap(),
        if (msg != null) 'm': msg!.toMap(),
      };
}
