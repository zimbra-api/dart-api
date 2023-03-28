// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_identities_request.dart';
import 'get_identities_response.dart';

class GetIdentitiesBody extends SoapBody {
  GetIdentitiesBody(
      {GetIdentitiesRequest? request, GetIdentitiesResponse? response})
      : super(request: request, response: response);

  factory GetIdentitiesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetIdentitiesBody(
        response: data['GetIdentitiesResponse'] != null
            ? GetIdentitiesResponse.fromMap(
                data['GetIdentitiesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetIdentitiesRequest': request!.toMap(),
      };
}
