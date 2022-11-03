// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'modify_signature_request.dart';
import 'modify_signature_response.dart';

class ModifySignatureBody extends SoapBody {
  ModifySignatureBody({ModifySignatureRequest? request, ModifySignatureResponse? response})
      : super(request: request, response: response);

  factory ModifySignatureBody.fromMap(Map<String, dynamic> data) => ModifySignatureBody(
      response: data['ModifySignatureResponse'] != null
          ? ModifySignatureResponse.fromMap(data['ModifySignatureResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifySignatureRequest': request!.toMap(),
      };
}
