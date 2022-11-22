// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'remove_attachments_request.dart';
import 'remove_attachments_response.dart';

class RemoveAttachmentsBody extends SoapBody {
  RemoveAttachmentsBody({RemoveAttachmentsRequest? request, RemoveAttachmentsResponse? response})
      : super(request: request, response: response);

  factory RemoveAttachmentsBody.fromMap(Map<String, dynamic> data) => RemoveAttachmentsBody(
      response: data['RemoveAttachmentsResponse'] != null
          ? RemoveAttachmentsResponse.fromMap(data['RemoveAttachmentsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RemoveAttachmentsRequest': request!.toMap(),
      };
}
