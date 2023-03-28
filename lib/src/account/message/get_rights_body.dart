// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_rights_request.dart';
import 'get_rights_response.dart';

class GetRightsBody extends SoapBody {
  GetRightsBody({
    GetRightsRequest? request,
    GetRightsResponse? response,
  }) : super(request: request, response: response);

  factory GetRightsBody.fromMap(Map<String, dynamic> data) => GetRightsBody(
        response: data['GetRightsResponse'] != null
            ? GetRightsResponse.fromMap(
                data['GetRightsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetRightsRequest': request!.toMap(),
      };
}
