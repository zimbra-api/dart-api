// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'test_data_source_body.dart';

class TestDataSourceEnvelope extends SoapEnvelope {
  TestDataSourceEnvelope(TestDataSourceBody body, {super.header}) : super(body);

  factory TestDataSourceEnvelope.fromJson(Map<String, dynamic> json) =>
      TestDataSourceEnvelope(TestDataSourceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  TestDataSourceBody get testDataSourceBody => body as TestDataSourceBody;
}
