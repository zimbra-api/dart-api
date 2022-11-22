// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'verify_code_body.dart';
import 'verify_code_envelope.dart';

/// Validate the verification code sent to a device.
/// After successful validation the server sets the device email address as
/// the value of zimbraCalendarReminderDeviceEmail account attribute.
class VerifyCodeRequest extends SoapRequest {
  /// Device email address
  final String address;

  /// recovery account verification code
  final String verificationCode;

  VerifyCodeRequest(this.address, this.verificationCode);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => VerifyCodeEnvelope(VerifyCodeBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'a': address,
        'code': verificationCode,
      };
}
