// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'grant_rights_request.dart';
import 'grant_rights_response.dart';

class GrantRightsBody extends SoapBody {
  GrantRightsBody({
    GrantRightsRequest? request,
    GrantRightsResponse? response,
  }) : super(request: request, response: response);

  factory GrantRightsBody.fromMap(Map<String, dynamic> data) => GrantRightsBody(
        response: data['GrantRightsResponse'] != null
            ? GrantRightsResponse.fromMap(
                data['GrantRightsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GrantRightsRequest': request!.toMap(),
      };
}
