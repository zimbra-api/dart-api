// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_data_source_request.dart';
import 'create_data_source_response.dart';

class CreateDataSourceBody extends SoapBody {
  CreateDataSourceBody({CreateDataSourceRequest? request, CreateDataSourceResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateDataSourceBody.fromJson(Map<String, dynamic> json) => CreateDataSourceBody(
      response: json['CreateDataSourceResponse'] != null
          ? CreateDataSourceResponse.fromJson(json['CreateDataSourceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateDataSourceRequest? get createDataSourceRequest => request as CreateDataSourceRequest?;

  CreateDataSourceResponse? get createDataSourceResponse => response as CreateDataSourceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateDataSourceRequest': request!.toJson(),
      };
}
