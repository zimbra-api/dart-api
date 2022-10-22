// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_recur_request.dart';
import 'get_recur_response.dart';

class GetRecurBody extends SoapBody {
  GetRecurBody({GetRecurRequest? request, GetRecurResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetRecurBody.fromJson(Map<String, dynamic> json) => GetRecurBody(
      response: json['GetRecurResponse'] != null ? GetRecurResponse.fromJson(json['GetRecurResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetRecurRequest? get getRecurRequest => request as GetRecurRequest?;

  GetRecurResponse? get getRecurResponse => response as GetRecurResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetRecurRequest': request!.toJson(),
      };
}
