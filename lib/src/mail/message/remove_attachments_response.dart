// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/message_info.dart';

class RemoveAttachmentsResponse extends SoapResponse {
  /// Information about the message
  final MessageInfo? msgMessage;

  /// Information about the chat message
  final MessageInfo? chatMessage;

  RemoveAttachmentsResponse({this.msgMessage, this.chatMessage});

  factory RemoveAttachmentsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      RemoveAttachmentsResponse(
        msgMessage: data['m'] is Map
            ? MessageInfo.fromMap(
                data['m'],
              )
            : null,
        chatMessage: data['chat'] is Map
            ? MessageInfo.fromMap(
                data['chat'],
              )
            : null,
      );
}
