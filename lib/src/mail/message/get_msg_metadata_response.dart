// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/chat_summary.dart';
import 'package:zimbra_api/src/mail/type/message_summary.dart';

class GetMsgMetadataResponse extends SoapResponse {
  /// Message metadata
  final MessageSummary? message;

  /// Chat message metadata
  final ChatSummary? chatMessage;

  GetMsgMetadataResponse({this.message, this.chatMessage});

  factory GetMsgMetadataResponse.fromJson(Map<String, dynamic> json) => GetMsgMetadataResponse(
      message: json['m'] is Map ? MessageSummary.fromJson(json['m']) : null,
      chatMessage: json['chat'] is Map ? ChatSummary.fromJson(json['chat']) : null);
}
