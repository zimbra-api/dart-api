// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_filter_rules_request.dart';
import 'modify_filter_rules_response.dart';

class ModifyFilterRulesBody extends SoapBody {
  ModifyFilterRulesBody({ModifyFilterRulesRequest? request, ModifyFilterRulesResponse? response})
      : super(request: request, response: response);

  factory ModifyFilterRulesBody.fromMap(Map<String, dynamic> data) => ModifyFilterRulesBody(
      response: data['ModifyFilterRulesResponse'] != null
          ? ModifyFilterRulesResponse.fromMap(data['ModifyFilterRulesResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyFilterRulesRequest': request!.toMap(),
      };
}
