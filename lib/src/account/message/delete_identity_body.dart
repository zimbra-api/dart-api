// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'delete_identity_request.dart';
import 'delete_identity_response.dart';

class DeleteIdentityBody extends SoapBody {
  DeleteIdentityBody({DeleteIdentityRequest? request, DeleteIdentityResponse? response})
      : super(request: request, response: response);

  factory DeleteIdentityBody.fromMap(Map<String, dynamic> data) => DeleteIdentityBody(
      response: data['DeleteIdentityResponse'] != null
          ? DeleteIdentityResponse.fromMap(data['DeleteIdentityResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DeleteIdentityRequest': request!.toMap(),
      };
}
