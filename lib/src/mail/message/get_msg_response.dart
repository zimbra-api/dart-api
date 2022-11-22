// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/msg_with_group_info.dart';

class GetMsgResponse extends SoapResponse {
  /// Message information
  final MsgWithGroupInfo? msg;

  GetMsgResponse({this.msg});

  factory GetMsgResponse.fromMap(Map<String, dynamic> data) =>
      GetMsgResponse(msg: data['m'] is Map ? MsgWithGroupInfo.fromMap(data['m']) : null);
}
