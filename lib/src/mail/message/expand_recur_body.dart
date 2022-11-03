// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'expand_recur_request.dart';
import 'expand_recur_response.dart';

class ExpandRecurBody extends SoapBody {
  ExpandRecurBody({ExpandRecurRequest? request, ExpandRecurResponse? response, super.fault})
      : super(request: request, response: response);

  factory ExpandRecurBody.fromMap(Map<String, dynamic> data) => ExpandRecurBody(
      response: data['ExpandRecurResponse'] != null ? ExpandRecurResponse.fromMap(data['ExpandRecurResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ExpandRecurRequest? get expandRecurRequest => request as ExpandRecurRequest?;

  ExpandRecurResponse? get expandRecurResponse => response as ExpandRecurResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ExpandRecurRequest': request!.toMap(),
      };
}
