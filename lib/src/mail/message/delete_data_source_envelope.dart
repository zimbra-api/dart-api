// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'delete_data_source_body.dart';

class DeleteDataSourceEnvelope extends SoapEnvelope {
  DeleteDataSourceEnvelope(DeleteDataSourceBody body, {super.header}) : super(body);

  factory DeleteDataSourceEnvelope.fromJson(Map<String, dynamic> json) =>
      DeleteDataSourceEnvelope(DeleteDataSourceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  DeleteDataSourceBody get deleteDataSourceBody => body as DeleteDataSourceBody;
}
