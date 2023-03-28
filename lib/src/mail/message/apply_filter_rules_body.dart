// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'apply_filter_rules_request.dart';
import 'apply_filter_rules_response.dart';

class ApplyFilterRulesBody extends SoapBody {
  ApplyFilterRulesBody({
    ApplyFilterRulesRequest? request,
    ApplyFilterRulesResponse? response,
  }) : super(request: request, response: response);

  factory ApplyFilterRulesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ApplyFilterRulesBody(
        response: data['ApplyFilterRulesResponse'] != null
            ? ApplyFilterRulesResponse.fromMap(
                data['ApplyFilterRulesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ApplyFilterRulesRequest': request!.toMap(),
      };
}
