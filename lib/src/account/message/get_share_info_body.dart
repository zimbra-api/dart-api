// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_share_info_request.dart';
import 'get_share_info_response.dart';

class GetShareInfoBody extends SoapBody {
  GetShareInfoBody({GetShareInfoRequest? request, GetShareInfoResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetShareInfoBody.fromMap(Map<String, dynamic> data) => GetShareInfoBody(
      response:
          data['GetShareInfoResponse'] != null ? GetShareInfoResponse.fromMap(data['GetShareInfoResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetShareInfoRequest? get getShareInfoRequest => request as GetShareInfoRequest?;

  GetShareInfoResponse? get getShareInfoResponse => response as GetShareInfoResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetShareInfoRequest': request!.toMap(),
      };
}
