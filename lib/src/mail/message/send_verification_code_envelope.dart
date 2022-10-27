// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'send_verification_code_body.dart';

class SendVerificationCodeEnvelope extends SoapEnvelope {
  SendVerificationCodeEnvelope(SendVerificationCodeBody body, {super.header}) : super(body);

  factory SendVerificationCodeEnvelope.fromJson(Map<String, dynamic> json) =>
      SendVerificationCodeEnvelope(SendVerificationCodeBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SendVerificationCodeBody get sendVerificationCodeBody => body as SendVerificationCodeBody;
}