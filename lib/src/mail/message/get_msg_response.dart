// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/msg_with_group_info.dart';

class GetMsgResponse extends SoapResponse {
  /// Message information
  final MsgWithGroupInfo? msg;

  GetMsgResponse({this.msg});

  factory GetMsgResponse.fromJson(Map<String, dynamic> json) =>
      GetMsgResponse(msg: json['m'] is Map ? MsgWithGroupInfo.fromJson(json['m']) : null);
}
