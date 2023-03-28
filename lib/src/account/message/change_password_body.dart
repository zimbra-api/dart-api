// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'change_password_request.dart';
import 'change_password_response.dart';

class ChangePasswordBody extends SoapBody {
  ChangePasswordBody({
    ChangePasswordRequest? request,
    ChangePasswordResponse? response,
  }) : super(request: request, response: response);

  factory ChangePasswordBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ChangePasswordBody(
        response: data['ChangePasswordResponse'] != null
            ? ChangePasswordResponse.fromMap(data['ChangePasswordResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ChangePasswordRequest': request!.toMap(),
      };
}
