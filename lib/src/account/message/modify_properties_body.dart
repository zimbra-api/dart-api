// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_properties_request.dart';
import 'modify_properties_response.dart';

class ModifyPropertiesBody extends SoapBody {
  ModifyPropertiesBody({ModifyPropertiesRequest? request, ModifyPropertiesResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyPropertiesBody.fromMap(Map<String, dynamic> data) => ModifyPropertiesBody(
      response: data['ModifyPropertiesResponse'] != null
          ? ModifyPropertiesResponse.fromMap(data['ModifyPropertiesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ModifyPropertiesRequest? get modifyPropertiesRequest => request as ModifyPropertiesRequest?;

  ModifyPropertiesResponse? get modifyPropertiesResponse => response as ModifyPropertiesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyPropertiesRequest': request!.toMap(),
      };
}
