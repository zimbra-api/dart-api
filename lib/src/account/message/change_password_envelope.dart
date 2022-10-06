// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'change_password_body.dart';

class ChangePasswordEnvelope extends SoapEnvelope {
  ChangePasswordEnvelope(ChangePasswordBody body, {SoapHeader? header}) : super(body, header: header);

  factory ChangePasswordEnvelope.fromJson(Map<String, dynamic> json) =>
      ChangePasswordEnvelope(ChangePasswordBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ChangePasswordBody get changePasswordBody => body as ChangePasswordBody;
}
