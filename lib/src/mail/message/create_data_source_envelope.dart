// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_data_source_body.dart';

class CreateDataSourceEnvelope extends SoapEnvelope {
  CreateDataSourceEnvelope(CreateDataSourceBody body, {super.header}) : super(body);

  factory CreateDataSourceEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateDataSourceEnvelope(CreateDataSourceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateDataSourceBody get createDataSourceBody => body as CreateDataSourceBody;
}
