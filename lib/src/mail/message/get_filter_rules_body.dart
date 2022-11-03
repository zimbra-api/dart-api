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

  factory GetFilterRulesBody.fromMap(Map<String, dynamic> data) => GetFilterRulesBody(
      response: data['GetFilterRulesResponse'] != null
          ? GetFilterRulesResponse.fromMap(data['GetFilterRulesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetFilterRulesRequest': request!.toMap(),
      };
}
