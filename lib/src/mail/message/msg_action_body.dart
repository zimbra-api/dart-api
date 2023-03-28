// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'msg_action_request.dart';
import 'msg_action_response.dart';

class MsgActionBody extends SoapBody {
  MsgActionBody({
    MsgActionRequest? request,
    MsgActionResponse? response,
  }) : super(request: request, response: response);

  factory MsgActionBody.fromMap(Map<String, dynamic> data) => MsgActionBody(
        response: data['MsgActionResponse'] != null
            ? MsgActionResponse.fromMap(
                data['MsgActionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'MsgActionRequest': request!.toMap(),
      };
}
