// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_msg_metadata_request.dart';
import 'get_msg_metadata_response.dart';

class GetMsgMetadataBody extends SoapBody {
  GetMsgMetadataBody({GetMsgMetadataRequest? request, GetMsgMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetMsgMetadataBody.fromMap(Map<String, dynamic> data) => GetMsgMetadataBody(
      response: data['GetMsgMetadataResponse'] != null
          ? GetMsgMetadataResponse.fromMap(data['GetMsgMetadataResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetMsgMetadataRequest? get getMsgMetadataRequest => request as GetMsgMetadataRequest?;

  GetMsgMetadataResponse? get getMsgMetadataResponse => response as GetMsgMetadataResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetMsgMetadataRequest': request!.toMap(),
      };
}
