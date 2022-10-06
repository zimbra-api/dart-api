// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_zimlet_prefs_request.dart';
import 'modify_zimlet_prefs_response.dart';

class ModifyZimletPrefsBody extends SoapBody {
  ModifyZimletPrefsBody({ModifyZimletPrefsRequest? request, ModifyZimletPrefsResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory ModifyZimletPrefsBody.fromJson(Map<String, dynamic> json) => ModifyZimletPrefsBody(
      response: json['ModifyZimletPrefsResponse'] != null
          ? ModifyZimletPrefsResponse.fromJson(json['ModifyZimletPrefsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyZimletPrefsRequest? get modifyZimletPrefsRequest => request as ModifyZimletPrefsRequest;

  ModifyZimletPrefsResponse? get modifyZimletPrefsResponse => response as ModifyZimletPrefsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyZimletPrefsRequest': request!.toJson(),
      };
}
