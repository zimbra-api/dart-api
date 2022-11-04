// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'reset_password_body.dart';
import 'reset_password_envelope.dart';

/// Reset password
class ResetPasswordRequest extends SoapRequest {
  /// New password to assign
  final String password;

  ResetPasswordRequest(this.password);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ResetPasswordEnvelope(ResetPasswordBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'password': {'_content': password},
      };
}
