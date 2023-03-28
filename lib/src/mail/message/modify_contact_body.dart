// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_contact_request.dart';
import 'modify_contact_response.dart';

class ModifyContactBody extends SoapBody {
  ModifyContactBody({
    ModifyContactRequest? request,
    ModifyContactResponse? response,
  }) : super(request: request, response: response);

  factory ModifyContactBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ModifyContactBody(
        response: data['ModifyContactResponse'] != null
            ? ModifyContactResponse.fromMap(
                data['ModifyContactResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyContactRequest': request!.toMap(),
      };
}
