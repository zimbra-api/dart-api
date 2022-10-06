// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_prefs_request.dart';
import 'modify_prefs_response.dart';

class ModifyPrefsBody extends SoapBody {
  ModifyPrefsBody({ModifyPrefsRequest? request, ModifyPrefsResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory ModifyPrefsBody.fromJson(Map<String, dynamic> json) => ModifyPrefsBody(
      response: json['ModifyPrefsResponse'] != null ? ModifyPrefsResponse.fromJson(json['ModifyPrefsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyPrefsRequest? get modifyPrefsRequest => request as ModifyPrefsRequest;

  ModifyPrefsResponse? get modifyPrefsResponse => response as ModifyPrefsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyPrefsRequest': request!.toJson(),
      };
}
