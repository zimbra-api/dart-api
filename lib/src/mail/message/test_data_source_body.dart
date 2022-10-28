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

  factory TestDataSourceBody.fromJson(Map<String, dynamic> json) => TestDataSourceBody(
      response: json['TestDataSourceResponse'] != null
          ? TestDataSourceResponse.fromJson(json['TestDataSourceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  TestDataSourceRequest? get testDataSourceRequest => request as TestDataSourceRequest?;

  TestDataSourceResponse? get testDataSourceResponse => response as TestDataSourceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'TestDataSourceRequest': request!.toJson(),
      };
}
