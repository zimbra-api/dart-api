// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_filter_rules_request.dart';
import 'get_filter_rules_response.dart';

class GetFilterRulesBody extends SoapBody {
  GetFilterRulesBody({GetFilterRulesRequest? request, GetFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetFilterRulesBody.fromJson(Map<String, dynamic> json) => GetFilterRulesBody(
      response: json['GetFilterRulesResponse'] != null
          ? GetFilterRulesResponse.fromJson(json['GetFilterRulesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetFilterRulesRequest? get getFilterRulesRequest => request as GetFilterRulesRequest?;

  GetFilterRulesResponse? get getFilterRulesResponse => response as GetFilterRulesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetFilterRulesRequest': request!.toJson(),
      };
}
