// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/conversation_info.dart';

class GetConvResponse extends SoapResponse {
  /// Conversation information
  final ConversationInfo? conversation;

  GetConvResponse({this.conversation});

  factory GetConvResponse.fromMap(Map<String, dynamic> data) =>
      GetConvResponse(conversation: data['c'] is Map ? ConversationInfo.fromMap(data['c']) : null);
}
