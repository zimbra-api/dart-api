// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'verify_code_body.dart';

class VerifyCodeEnvelope extends SoapEnvelope {
  VerifyCodeEnvelope(VerifyCodeBody body, {super.header}) : super(body);

  factory VerifyCodeEnvelope.fromJson(Map<String, dynamic> json) =>
      VerifyCodeEnvelope(VerifyCodeBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  VerifyCodeBody get verifyCodeBody => body as VerifyCodeBody;
}
