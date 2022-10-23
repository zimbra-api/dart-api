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

  factory ModifyDataSourceBody.fromJson(Map<String, dynamic> json) => ModifyDataSourceBody(
      response: json['ModifyDataSourceResponse'] != null
          ? ModifyDataSourceResponse.fromJson(json['ModifyDataSourceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyDataSourceRequest? get modifyDataSourceRequest => request as ModifyDataSourceRequest?;

  ModifyDataSourceResponse? get modifyDataSourceResponse => response as ModifyDataSourceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyDataSourceRequest': request!.toJson(),
      };
}
