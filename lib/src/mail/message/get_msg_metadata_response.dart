// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/chat_summary.dart';
import '../type/message_summary.dart';

class GetMsgMetadataResponse extends SoapResponse {
  /// Message metadata
  final MessageSummary? message;

  /// Chat message metadata
  final ChatSummary? chatMessage;

  GetMsgMetadataResponse({this.message, this.chatMessage});

  factory GetMsgMetadataResponse.fromMap(Map<String, dynamic> data) => GetMsgMetadataResponse(
      message: data['m'] is Map ? MessageSummary.fromMap(data['m']) : null,
      chatMessage: data['chat'] is Map ? ChatSummary.fromMap(data['chat']) : null);
}
