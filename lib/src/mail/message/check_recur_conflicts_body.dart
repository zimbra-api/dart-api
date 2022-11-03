// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'check_recur_conflicts_request.dart';
import 'check_recur_conflicts_response.dart';

class CheckRecurConflictsBody extends SoapBody {
  CheckRecurConflictsBody({CheckRecurConflictsRequest? request, CheckRecurConflictsResponse? response, super.fault})
      : super(request: request, response: response);

  factory CheckRecurConflictsBody.fromMap(Map<String, dynamic> data) => CheckRecurConflictsBody(
      response: data['CheckRecurConflictsResponse'] != null
          ? CheckRecurConflictsResponse.fromMap(data['CheckRecurConflictsResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CheckRecurConflictsRequest? get checkRecurConflictsRequest => request as CheckRecurConflictsRequest?;

  CheckRecurConflictsResponse? get checkRecurConflictsResponse => response as CheckRecurConflictsResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CheckRecurConflictsRequest': request!.toMap(),
      };
}
