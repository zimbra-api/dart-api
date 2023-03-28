// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'get_system_retention_policy_body.dart';

class GetSystemRetentionPolicyEnvelope extends SoapEnvelope {
  GetSystemRetentionPolicyEnvelope(
    GetSystemRetentionPolicyBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory GetSystemRetentionPolicyEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetSystemRetentionPolicyEnvelope(
        GetSystemRetentionPolicyBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}
