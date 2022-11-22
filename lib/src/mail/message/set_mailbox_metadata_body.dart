// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'set_mailbox_metadata_request.dart';
import 'set_mailbox_metadata_response.dart';

class SetMailboxMetadataBody extends SoapBody {
  SetMailboxMetadataBody({SetMailboxMetadataRequest? request, SetMailboxMetadataResponse? response})
      : super(request: request, response: response);

  factory SetMailboxMetadataBody.fromMap(Map<String, dynamic> data) => SetMailboxMetadataBody(
      response: data['SetMailboxMetadataResponse'] != null
          ? SetMailboxMetadataResponse.fromMap(data['SetMailboxMetadataResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetMailboxMetadataRequest': request!.toMap(),
      };
}
