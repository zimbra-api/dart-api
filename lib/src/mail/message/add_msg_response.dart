// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/chat_summary.dart';
import 'package:zimbra_api/src/mail/type/message_summary.dart';

class AddMsgResponse extends SoapResponse {
  /// Details of added message
  final MessageSummary? message;

  /// Details of added chat message
  final ChatSummary? chatMessage;

  AddMsgResponse({this.message, this.chatMessage});

  factory AddMsgResponse.fromJson(Map<String, dynamic> json) => AddMsgResponse(
      message: json['m']?[0] is Map ? MessageSummary.fromJson(json['m'][0]) : null,
      chatMessage: json['chat']?[0] is Map ? ChatSummary.fromJson(json['chat'][0]) : null);
}
