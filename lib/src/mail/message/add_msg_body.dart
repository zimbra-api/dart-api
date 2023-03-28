// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'add_msg_request.dart';
import 'add_msg_response.dart';

class AddMsgBody extends SoapBody {
  AddMsgBody({
    AddMsgRequest? request,
    AddMsgResponse? response,
  }) : super(request: request, response: response);

  factory AddMsgBody.fromMap(Map<String, dynamic> data) => AddMsgBody(
        response: data['AddMsgResponse'] != null
            ? AddMsgResponse.fromMap(
                data['AddMsgResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AddMsgRequest': request!.toMap(),
      };
}
