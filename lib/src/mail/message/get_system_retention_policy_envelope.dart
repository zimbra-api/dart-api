// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_system_retention_policy_body.dart';

class GetSystemRetentionPolicyEnvelope extends SoapEnvelope {
  GetSystemRetentionPolicyEnvelope(GetSystemRetentionPolicyBody body, {super.header}) : super(body);

  factory GetSystemRetentionPolicyEnvelope.fromJson(Map<String, dynamic> json) =>
      GetSystemRetentionPolicyEnvelope(GetSystemRetentionPolicyBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetSystemRetentionPolicyBody get getSystemRetentionPolicyBody => body as GetSystemRetentionPolicyBody;
}
