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

  factory CreateDataSourceBody.fromMap(Map<String, dynamic> data) => CreateDataSourceBody(
      response: data['CreateDataSourceResponse'] != null
          ? CreateDataSourceResponse.fromMap(data['CreateDataSourceResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CreateDataSourceRequest? get createDataSourceRequest => request as CreateDataSourceRequest?;

  CreateDataSourceResponse? get createDataSourceResponse => response as CreateDataSourceResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateDataSourceRequest': request!.toMap(),
      };
}
