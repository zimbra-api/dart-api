// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'reset_password_request.dart';
import 'reset_password_response.dart';

class ResetPasswordBody extends SoapBody {
  ResetPasswordBody({
    ResetPasswordRequest? request,
    ResetPasswordResponse? response,
  }) : super(request: request, response: response);

  factory ResetPasswordBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ResetPasswordBody(
        response: data['ResetPasswordResponse'] != null
            ? ResetPasswordResponse.fromMap(
                data['ResetPasswordResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ResetPasswordRequest': request!.toMap(),
      };
}
