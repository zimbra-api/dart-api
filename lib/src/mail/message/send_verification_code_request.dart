// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'send_verification_code_body.dart';
import 'send_verification_code_envelope.dart';

/// SendVerificationCodeRequest results in a random verification code being generated and sent to a device.
class SendVerificationCodeRequest extends SoapRequest {
  /// Device email address
  final String address;

  SendVerificationCodeRequest(this.address);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SendVerificationCodeEnvelope(SendVerificationCodeBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'a': address,
      };
}
