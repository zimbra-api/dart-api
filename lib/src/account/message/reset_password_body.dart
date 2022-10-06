// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'reset_password_request.dart';
import 'reset_password_response.dart';

class ResetPasswordBody extends SoapBody {
  ResetPasswordBody({ResetPasswordRequest? request, ResetPasswordResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory ResetPasswordBody.fromJson(Map<String, dynamic> json) => ResetPasswordBody(
      response:
          json['ResetPasswordResponse'] != null ? ResetPasswordResponse.fromJson(json['ResetPasswordResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ResetPasswordRequest? get resetPasswordRequest => request as ResetPasswordRequest;

  ResetPasswordResponse? get resetPasswordResponse => response as ResetPasswordResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ResetPasswordRequest': request!.toJson(),
      };
}
