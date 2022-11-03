// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_white_black_list_request.dart';
import 'get_white_black_list_response.dart';

class GetWhiteBlackListBody extends SoapBody {
  GetWhiteBlackListBody({GetWhiteBlackListRequest? request, GetWhiteBlackListResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetWhiteBlackListBody.fromMap(Map<String, dynamic> data) => GetWhiteBlackListBody(
      response: data['GetWhiteBlackListResponse'] != null
          ? GetWhiteBlackListResponse.fromMap(data['GetWhiteBlackListResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetWhiteBlackListRequest': request!.toMap(),
      };
}
