// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'modify_identity_request.dart';
import 'modify_identity_response.dart';

class ModifyIdentityBody extends SoapBody {
  ModifyIdentityBody({ModifyIdentityRequest? request, ModifyIdentityResponse? response})
      : super(request: request, response: response);

  factory ModifyIdentityBody.fromMap(Map<String, dynamic> data) => ModifyIdentityBody(
      response: data['ModifyIdentityResponse'] != null
          ? ModifyIdentityResponse.fromMap(data['ModifyIdentityResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyIdentityRequest': request!.toMap(),
      };
}
