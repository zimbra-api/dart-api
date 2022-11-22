// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_msg_request.dart';
import 'get_msg_response.dart';

class GetMsgBody extends SoapBody {
  GetMsgBody({GetMsgRequest? request, GetMsgResponse? response})
      : super(request: request, response: response);

  factory GetMsgBody.fromMap(Map<String, dynamic> data) => GetMsgBody(
      response: data['GetMsgResponse'] != null ? GetMsgResponse.fromMap(data['GetMsgResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetMsgRequest': request!.toMap(),
      };
}
