// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'generate_uuid_body.dart';

class GenerateUUIDEnvelope extends SoapEnvelope {
  GenerateUUIDEnvelope(GenerateUUIDBody body, {super.header}) : super(body);

  factory GenerateUUIDEnvelope.fromJson(Map<String, dynamic> json) =>
      GenerateUUIDEnvelope(GenerateUUIDBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GenerateUUIDBody get generateUUIDBody => body as GenerateUUIDBody;
}