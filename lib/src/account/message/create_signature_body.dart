// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'create_signature_request.dart';
import 'create_signature_response.dart';

class CreateSignatureBody extends SoapBody {
  CreateSignatureBody({CreateSignatureRequest? request, CreateSignatureResponse? response})
      : super(request: request, response: response);

  factory CreateSignatureBody.fromMap(Map<String, dynamic> data) => CreateSignatureBody(
      response: data['CreateSignatureResponse'] != null
          ? CreateSignatureResponse.fromMap(data['CreateSignatureResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateSignatureRequest': request!.toMap(),
      };
}
