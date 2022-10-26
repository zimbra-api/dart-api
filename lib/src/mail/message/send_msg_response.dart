// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/msg_with_group_info.dart';

class SendMsgResponse extends SoapResponse {
  /// Message Information about the saved copy of the sent message.
  /// Note, "m" element will have no content if the message was not saved.
  /// Note, Full information will be provided if fetchSavedMsg was specified in the request,
  /// otherwise only the message id will be returned.
  final MsgWithGroupInfo? msg;

  SendMsgResponse({this.msg});

  factory SendMsgResponse.fromJson(Map<String, dynamic> json) =>
      SendMsgResponse(msg: json['m'] is Map ? MsgWithGroupInfo.fromJson(json['m']) : null);
}
