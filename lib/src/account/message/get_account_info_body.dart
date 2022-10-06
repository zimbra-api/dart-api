// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_account_info_request.dart';
import 'get_account_info_response.dart';

class GetAccountInfoBody extends SoapBody {
  GetAccountInfoBody({GetAccountInfoRequest? request, GetAccountInfoResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetAccountInfoBody.fromJson(Map<String, dynamic> json) => GetAccountInfoBody(
      response: json['GetAccountInfoResponse'] != null
          ? GetAccountInfoResponse.fromJson(json['GetAccountInfoResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAccountInfoRequest? get getAccountInfoRequest => request as GetAccountInfoRequest;

  GetAccountInfoResponse? get getAccountInfoResponse => response as GetAccountInfoResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAccountInfoRequest': request!.toJson(),
      };
}
