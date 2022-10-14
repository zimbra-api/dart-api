// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'auto_complete_request.dart';
import 'auto_complete_response.dart';

class AutoCompleteBody extends SoapBody {
  AutoCompleteBody({AutoCompleteRequest? request, AutoCompleteResponse? response, super.fault})
      : super(request: request, response: response);

  factory AutoCompleteBody.fromJson(Map<String, dynamic> json) => AutoCompleteBody(
      response:
          json['AutoCompleteResponse'] != null ? AutoCompleteResponse.fromJson(json['AutoCompleteResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AutoCompleteRequest? get autoCompleteRequest => request as AutoCompleteRequest?;

  AutoCompleteResponse? get autoCompleteResponse => response as AutoCompleteResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AutoCompleteRequest': request!.toJson(),
      };
}
