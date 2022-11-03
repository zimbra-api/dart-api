// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'auth_request.dart';
import 'auth_response.dart';

class AuthBody extends SoapBody {
  AuthBody({AuthRequest? request, AuthResponse? response, super.fault}) : super(request: request, response: response);

  factory AuthBody.fromMap(Map<String, dynamic> data) => AuthBody(
      response: data['AuthResponse'] != null ? AuthResponse.fromMap(data['AuthResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  AuthRequest? get authRequest => request as AuthRequest?;

  AuthResponse? get authResponse => response as AuthResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AuthRequest': request!.toMap(),
      };
}
