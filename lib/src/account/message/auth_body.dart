// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'auth_request.dart';
import 'auth_response.dart';

class AuthBody extends SoapBody {
  AuthBody({AuthRequest? request, AuthResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory AuthBody.fromJson(Map<String, dynamic> json) => AuthBody(
      response: json['AuthResponse'] != null ? AuthResponse.fromJson(json['AuthResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  AuthRequest? get authRequest => request as AuthRequest;

  AuthResponse? get authResponse => response as AuthResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'AuthRequest': request!.toJson(),
      };
}
