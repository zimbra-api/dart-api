// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_outgoing_filter_rules_request.dart';
import 'get_outgoing_filter_rules_response.dart';

class GetOutgoingFilterRulesBody extends SoapBody {
  GetOutgoingFilterRulesBody(
      {GetOutgoingFilterRulesRequest? request, GetOutgoingFilterRulesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetOutgoingFilterRulesBody.fromJson(Map<String, dynamic> json) => GetOutgoingFilterRulesBody(
      response: json['GetOutgoingFilterRulesResponse'] != null
          ? GetOutgoingFilterRulesResponse.fromJson(json['GetOutgoingFilterRulesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetOutgoingFilterRulesRequest? get getOutgoingFilterRulesRequest => request as GetOutgoingFilterRulesRequest?;

  GetOutgoingFilterRulesResponse? get getOutgoingFilterRulesResponse => response as GetOutgoingFilterRulesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetOutgoingFilterRulesRequest': request!.toJson(),
      };
}
