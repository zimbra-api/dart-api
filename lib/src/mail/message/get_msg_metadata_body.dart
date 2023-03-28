// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_msg_metadata_request.dart';
import 'get_msg_metadata_response.dart';

class GetMsgMetadataBody extends SoapBody {
  GetMsgMetadataBody({
    GetMsgMetadataRequest? request,
    GetMsgMetadataResponse? response,
  }) : super(request: request, response: response);

  factory GetMsgMetadataBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetMsgMetadataBody(
        response: data['GetMsgMetadataResponse'] != null
            ? GetMsgMetadataResponse.fromMap(data['GetMsgMetadataResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetMsgMetadataRequest': request!.toMap(),
      };
}
