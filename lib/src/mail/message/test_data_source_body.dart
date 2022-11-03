// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'test_data_source_request.dart';
import 'test_data_source_response.dart';

class TestDataSourceBody extends SoapBody {
  TestDataSourceBody({TestDataSourceRequest? request, TestDataSourceResponse? response, super.fault})
      : super(request: request, response: response);

  factory TestDataSourceBody.fromMap(Map<String, dynamic> data) => TestDataSourceBody(
      response: data['TestDataSourceResponse'] != null
          ? TestDataSourceResponse.fromMap(data['TestDataSourceResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'TestDataSourceRequest': request!.toMap(),
      };
}
