// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'contact_action_request.dart';
import 'contact_action_response.dart';

class ContactActionBody extends SoapBody {
  ContactActionBody({
    ContactActionRequest? request,
    ContactActionResponse? response,
  }) : super(request: request, response: response);

  factory ContactActionBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ContactActionBody(
        response: data['ContactActionResponse'] != null
            ? ContactActionResponse.fromMap(
                data['ContactActionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ContactActionRequest': request!.toMap(),
      };
}
