// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_contact_request.dart';
import 'modify_contact_response.dart';

class ModifyContactBody extends SoapBody {
  ModifyContactBody({ModifyContactRequest? request, ModifyContactResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyContactBody.fromJson(Map<String, dynamic> json) => ModifyContactBody(
      response:
          json['ModifyContactResponse'] != null ? ModifyContactResponse.fromJson(json['ModifyContactResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyContactRequest? get modifyContactRequest => request as ModifyContactRequest?;

  ModifyContactResponse? get modifyContactResponse => response as ModifyContactResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyContactRequest': request!.toJson(),
      };
}
