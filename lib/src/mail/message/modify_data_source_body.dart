// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_data_source_request.dart';
import 'modify_data_source_response.dart';

class ModifyDataSourceBody extends SoapBody {
  ModifyDataSourceBody({ModifyDataSourceRequest? request, ModifyDataSourceResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyDataSourceBody.fromMap(Map<String, dynamic> data) => ModifyDataSourceBody(
      response: data['ModifyDataSourceResponse'] != null
          ? ModifyDataSourceResponse.fromMap(data['ModifyDataSourceResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyDataSourceRequest': request!.toMap(),
      };
}
