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

  factory ModifyContactBody.fromMap(Map<String, dynamic> data) => ModifyContactBody(
      response:
          data['ModifyContactResponse'] != null ? ModifyContactResponse.fromMap(data['ModifyContactResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyContactRequest': request!.toMap(),
      };
}
