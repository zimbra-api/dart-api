// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/mail/message/modify_data_source_body.dart';

class ModifyDataSourceEnvelope extends SoapEnvelope {
  ModifyDataSourceEnvelope(ModifyDataSourceBody body, {super.header}) : super(body);

  factory ModifyDataSourceEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifyDataSourceEnvelope(ModifyDataSourceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifyDataSourceBody get modifyDataSourceBody => body as ModifyDataSourceBody;
}
