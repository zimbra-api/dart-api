// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_prefs_request.dart';
import 'get_prefs_response.dart';

class GetPrefsBody extends SoapBody {
  GetPrefsBody({GetPrefsRequest? request, GetPrefsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetPrefsBody.fromJson(Map<String, dynamic> json) => GetPrefsBody(
      response: json['GetPrefsResponse'] != null ? GetPrefsResponse.fromJson(json['GetPrefsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetPrefsRequest? get getPrefsRequest => request as GetPrefsRequest?;

  GetPrefsResponse? get getPrefsResponse => response as GetPrefsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetPrefsRequest': request!.toJson(),
      };
}
