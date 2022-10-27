// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'set_recovery_account_body.dart';

class SetRecoveryAccountEnvelope extends SoapEnvelope {
  SetRecoveryAccountEnvelope(SetRecoveryAccountBody body, {super.header}) : super(body);

  factory SetRecoveryAccountEnvelope.fromJson(Map<String, dynamic> json) =>
      SetRecoveryAccountEnvelope(SetRecoveryAccountBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SetRecoveryAccountBody get setRecoveryAccountBody => body as SetRecoveryAccountBody;
}
