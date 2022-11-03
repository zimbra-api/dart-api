// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'change_password_body.dart';

class ChangePasswordEnvelope extends SoapEnvelope {
  ChangePasswordEnvelope(ChangePasswordBody body, {super.header}) : super(body);

  factory ChangePasswordEnvelope.fromMap(Map<String, dynamic> data) =>
      ChangePasswordEnvelope(ChangePasswordBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ChangePasswordBody get changePasswordBody => body as ChangePasswordBody;
}
