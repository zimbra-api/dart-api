// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_mailbox_metadata_request.dart';
import 'get_mailbox_metadata_response.dart';

class GetMailboxMetadataBody extends SoapBody {
  GetMailboxMetadataBody({
    GetMailboxMetadataRequest? request,
    GetMailboxMetadataResponse? response,
  }) : super(request: request, response: response);

  factory GetMailboxMetadataBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetMailboxMetadataBody(
        response: data['GetMailboxMetadataResponse'] != null
            ? GetMailboxMetadataResponse.fromMap(
                data['GetMailboxMetadataResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetMailboxMetadataRequest': request!.toMap(),
      };
}
