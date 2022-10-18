// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'check_spelling_request.dart';
import 'check_spelling_response.dart';

class CheckSpellingBody extends SoapBody {
  CheckSpellingBody({CheckSpellingRequest? request, CheckSpellingResponse? response, super.fault})
      : super(request: request, response: response);

  factory CheckSpellingBody.fromJson(Map<String, dynamic> json) => CheckSpellingBody(
      response:
          json['CheckSpellingResponse'] != null ? CheckSpellingResponse.fromJson(json['CheckSpellingResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CheckSpellingRequest? get checkSpellingRequest => request as CheckSpellingRequest?;

  CheckSpellingResponse? get checkSpellingResponse => response as CheckSpellingResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CheckSpellingRequest': request!.toJson(),
      };
}