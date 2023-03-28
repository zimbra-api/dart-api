// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'apply_outgoing_filter_rules_request.dart';
import 'apply_outgoing_filter_rules_response.dart';

class ApplyOutgoingFilterRulesBody extends SoapBody {
  ApplyOutgoingFilterRulesBody({
    ApplyOutgoingFilterRulesRequest? request,
    ApplyOutgoingFilterRulesResponse? response,
  }) : super(request: request, response: response);

  factory ApplyOutgoingFilterRulesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ApplyOutgoingFilterRulesBody(
        response: data['ApplyOutgoingFilterRulesResponse'] != null
            ? ApplyOutgoingFilterRulesResponse.fromMap(
                data['ApplyOutgoingFilterRulesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ApplyOutgoingFilterRulesRequest': request!.toMap(),
      };
}
