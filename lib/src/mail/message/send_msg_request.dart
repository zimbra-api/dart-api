// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/msg_to_send.dart';
import 'send_msg_body.dart';
import 'send_msg_envelope.dart';

/// Send message
///
/// - Supports (f)rom, (t)o, (c)c, (b)cc, (r)eply-to, (s)ender, read-receipt (n)otification "type" on <e> elements.
/// - Only allowed one top-level <mp> but can nest <mp>s within if multipart/*
/// - A leaf <mp> can have inlined content (<mp ct="{content-type}"><content>...</content></mp>)
/// - A leaf <mp> can have referenced content (<mp><attach ...></mp>)
/// - Any <mp> can have a Content-ID header attached to it.
/// - On reply/forward, set origid on <m> element and set rt to "r" or "w", respectively
/// - Can optionally set identity-id to specify the identity being used to compose the message
/// - If noSave is set, a copy will not be saved to sent regardless of account/identity settings
/// - Can set priority high (!) or low (?) on sent message by specifying "f" attr on <m>
/// - The message to be sent can be fully specified under the <m> element or,
///   to compose the message remotely remotely, upload it via FileUploadServlet,
///   and submit it through our server using something like:
///      <code>
///         <SendMsgRequest [suid="{send-uid}"] [needCalendarSentByFixup="0|1"]>
///             <m aid="{uploaded-MIME-body-ID}" [origid="..." rt="r|w"]/>
///         </SendMsgRequest>
///      </code>
/// - If the message is saved to the sent folder then the ID of the message is returned.
///   Otherwise, no ID is returned -- just a <m> is returned.
class SendMsgRequest extends SoapRequest {
  /// Message
  final MsgToSend msg;

  /// If set then Add SENT-BY parameter to ORGANIZER and/or ATTENDEE properties in
  /// iCalendar part when sending message on behalf of another user. Default is unset.
  final bool? needCalendarSentByFixup;

  /// Indicates whether this a forward of calendar invitation in which
  /// case the server sends Forward Invitation Notification, default is unset.
  final bool? isCalendarForward;

  /// If set, a copy will not be saved to sent regardless of account/identity settings
  final bool? noSaveToSent;

  /// If set, return the copy of the sent message, if it was saved, in the response.
  final bool? fetchSavedMsg;

  /// Send UID
  final String? sendUid;

  /// If set, delivery receipt notification will be sent.
  final bool? deliveryReport;

  SendMsgRequest(this.msg,
      {this.needCalendarSentByFixup,
      this.isCalendarForward,
      this.noSaveToSent,
      this.fetchSavedMsg,
      this.sendUid,
      this.deliveryReport});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SendMsgEnvelope(SendMsgBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toMap(),
        if (needCalendarSentByFixup != null) 'needCalendarSentByFixup': needCalendarSentByFixup,
        if (isCalendarForward != null) 'isCalendarForward': isCalendarForward,
        if (noSaveToSent != null) 'noSave': noSaveToSent,
        if (fetchSavedMsg != null) 'fetchSavedMsg': fetchSavedMsg,
        if (sendUid != null) 'suid': sendUid,
        if (deliveryReport != null) 'deliveryReport': deliveryReport,
      };
}
