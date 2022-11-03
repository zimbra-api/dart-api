// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_prefs_request.dart';
import 'modify_prefs_response.dart';

class ModifyPrefsBody extends SoapBody {
  ModifyPrefsBody({ModifyPrefsRequest? request, ModifyPrefsResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyPrefsBody.fromMap(Map<String, dynamic> data) => ModifyPrefsBody(
      response: data['ModifyPrefsResponse'] != null ? ModifyPrefsResponse.fromMap(data['ModifyPrefsResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyPrefsRequest': request!.toMap(),
      };
}
