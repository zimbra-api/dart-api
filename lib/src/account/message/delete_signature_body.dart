// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'delete_signature_request.dart';
import 'delete_signature_response.dart';

class DeleteSignatureBody extends SoapBody {
  DeleteSignatureBody({
    DeleteSignatureRequest? request,
    DeleteSignatureResponse? response,
  }) : super(request: request, response: response);

  factory DeleteSignatureBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      DeleteSignatureBody(
        response: data['DeleteSignatureResponse'] != null
            ? DeleteSignatureResponse.fromMap(data['DeleteSignatureResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DeleteSignatureRequest': request!.toMap(),
      };
}
