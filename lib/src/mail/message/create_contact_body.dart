// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_contact_request.dart';
import 'create_contact_response.dart';

class CreateContactBody extends SoapBody {
  CreateContactBody({
    CreateContactRequest? request,
    CreateContactResponse? response,
  }) : super(request: request, response: response);

  factory CreateContactBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateContactBody(
        response: data['CreateContactResponse'] != null
            ? CreateContactResponse.fromMap(
                data['CreateContactResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateContactRequest': request!.toMap(),
      };
}
