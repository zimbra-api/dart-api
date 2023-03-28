// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_recur_request.dart';
import 'get_recur_response.dart';

class GetRecurBody extends SoapBody {
  GetRecurBody({
    GetRecurRequest? request,
    GetRecurResponse? response,
  }) : super(request: request, response: response);

  factory GetRecurBody.fromMap(Map<String, dynamic> data) => GetRecurBody(
        response: data['GetRecurResponse'] != null
            ? GetRecurResponse.fromMap(
                data['GetRecurResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetRecurRequest': request!.toMap(),
      };
}
