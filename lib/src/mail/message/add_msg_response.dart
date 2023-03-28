// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/chat_summary.dart';
import '../type/message_summary.dart';

class AddMsgResponse extends SoapResponse {
  /// Details of added message
  final MessageSummary? message;

  /// Details of added chat message
  final ChatSummary? chatMessage;

  AddMsgResponse({this.message, this.chatMessage});

  factory AddMsgResponse.fromMap(Map<String, dynamic> data) => AddMsgResponse(
        message: data['m']?[0] is Map
            ? MessageSummary.fromMap(
                data['m'][0],
              )
            : null,
        chatMessage: data['chat']?[0] is Map
            ? ChatSummary.fromMap(
                data['chat'][0],
              )
            : null,
      );
}
