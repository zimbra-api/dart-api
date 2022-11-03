// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'restore_contacts_request.dart';
import 'restore_contacts_response.dart';

class RestoreContactsBody extends SoapBody {
  RestoreContactsBody({RestoreContactsRequest? request, RestoreContactsResponse? response})
      : super(request: request, response: response);

  factory RestoreContactsBody.fromMap(Map<String, dynamic> data) => RestoreContactsBody(
      response: data['RestoreContactsResponse'] != null
          ? RestoreContactsResponse.fromMap(data['RestoreContactsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RestoreContactsRequest': request!.toMap(),
      };
}
