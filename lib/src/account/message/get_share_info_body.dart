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

  factory GetShareInfoBody.fromJson(Map<String, dynamic> json) => GetShareInfoBody(
      response:
          json['GetShareInfoResponse'] != null ? GetShareInfoResponse.fromJson(json['GetShareInfoResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetShareInfoRequest? get getShareInfoRequest => request as GetShareInfoRequest;

  GetShareInfoResponse? get getShareInfoResponse => response as GetShareInfoResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetShareInfoRequest': request!.toJson(),
      };
}
