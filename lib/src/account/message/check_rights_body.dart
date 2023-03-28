// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'check_rights_request.dart';
import 'check_rights_response.dart';

class CheckRightsBody extends SoapBody {
  CheckRightsBody({
    CheckRightsRequest? request,
    CheckRightsResponse? response,
  }) : super(request: request, response: response);

  factory CheckRightsBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      CheckRightsBody(
        response: data['CheckRightsResponse'] != null
            ? CheckRightsResponse.fromMap(
                data['CheckRightsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CheckRightsRequest': request!.toMap(),
      };
}
