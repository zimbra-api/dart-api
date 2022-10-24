// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/message_info.dart';

class SaveDraftResponse extends SoapResponse {
  /// Information on saved draft
  final MessageInfo? msgMessage;

  /// Information on saved chat draft
  final MessageInfo? chatMessage;

  SaveDraftResponse({this.msgMessage, this.chatMessage});

  factory SaveDraftResponse.fromJson(Map<String, dynamic> json) => SaveDraftResponse(
      msgMessage: json['m'] is Map ? MessageInfo.fromJson(json['m']) : null,
      chatMessage: json['chat'] is Map ? MessageInfo.fromJson(json['chat']) : null);
}