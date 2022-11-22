// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'revoke_rights_request.dart';
import 'revoke_rights_response.dart';

class RevokeRightsBody extends SoapBody {
  RevokeRightsBody({RevokeRightsRequest? request, RevokeRightsResponse? response})
      : super(request: request, response: response);

  factory RevokeRightsBody.fromMap(Map<String, dynamic> data) => RevokeRightsBody(
      response:
          data['RevokeRightsResponse'] != null ? RevokeRightsResponse.fromMap(data['RevokeRightsResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RevokeRightsRequest': request!.toMap(),
      };
}
