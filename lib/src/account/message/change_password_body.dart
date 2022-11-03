// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'change_password_request.dart';
import 'change_password_response.dart';

class ChangePasswordBody extends SoapBody {
  ChangePasswordBody({ChangePasswordRequest? request, ChangePasswordResponse? response, super.fault})
      : super(request: request, response: response);

  factory ChangePasswordBody.fromMap(Map<String, dynamic> data) => ChangePasswordBody(
      response: data['ChangePasswordResponse'] != null
          ? ChangePasswordResponse.fromMap(data['ChangePasswordResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ChangePasswordRequest? get changePasswordRequest => request as ChangePasswordRequest?;

  ChangePasswordResponse? get changePasswordResponse => response as ChangePasswordResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ChangePasswordRequest': request!.toMap(),
      };
}
