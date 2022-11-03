// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'send_verification_code_request.dart';
import 'send_verification_code_response.dart';

class SendVerificationCodeBody extends SoapBody {
  SendVerificationCodeBody({SendVerificationCodeRequest? request, SendVerificationCodeResponse? response, super.fault})
      : super(request: request, response: response);

  factory SendVerificationCodeBody.fromMap(Map<String, dynamic> data) => SendVerificationCodeBody(
      response: data['SendVerificationCodeResponse'] != null
          ? SendVerificationCodeResponse.fromMap(data['SendVerificationCodeResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SendVerificationCodeRequest? get sendVerificationCodeRequest => request as SendVerificationCodeRequest?;

  SendVerificationCodeResponse? get sendVerificationCodeResponse => response as SendVerificationCodeResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendVerificationCodeRequest': request!.toMap(),
      };
}
