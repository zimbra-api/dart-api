// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_oauth_consumers_request.dart';
import 'get_oauth_consumers_response.dart';

class GetOAuthConsumersBody extends SoapBody {
  GetOAuthConsumersBody({GetOAuthConsumersRequest? request, GetOAuthConsumersResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetOAuthConsumersBody.fromJson(Map<String, dynamic> json) => GetOAuthConsumersBody(
      response: json['GetOAuthConsumersResponse'] != null
          ? GetOAuthConsumersResponse.fromJson(json['GetOAuthConsumersResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetOAuthConsumersRequest? get getOAuthConsumersRequest => request as GetOAuthConsumersRequest;

  GetOAuthConsumersResponse? get getOAuthConsumersResponse => response as GetOAuthConsumersResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetOAuthConsumersRequest': request!.toJson(),
      };
}
