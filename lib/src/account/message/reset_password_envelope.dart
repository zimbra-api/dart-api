// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'reset_password_body.dart';

class ResetPasswordEnvelope extends SoapEnvelope {
  ResetPasswordEnvelope(ResetPasswordBody body, {super.header}) : super(body);

  factory ResetPasswordEnvelope.fromJson(Map<String, dynamic> json) =>
      ResetPasswordEnvelope(ResetPasswordBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ResetPasswordBody get resetPasswordBody => body as ResetPasswordBody;
}
