// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_mailbox_metadata_request.dart';
import 'set_mailbox_metadata_response.dart';

class SetMailboxMetadataBody extends SoapBody {
  SetMailboxMetadataBody({SetMailboxMetadataRequest? request, SetMailboxMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetMailboxMetadataBody.fromMap(Map<String, dynamic> data) => SetMailboxMetadataBody(
      response: data['SetMailboxMetadataResponse'] != null
          ? SetMailboxMetadataResponse.fromMap(data['SetMailboxMetadataResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SetMailboxMetadataRequest? get setMailboxMetadataRequest => request as SetMailboxMetadataRequest?;

  SetMailboxMetadataResponse? get setMailboxMetadataResponse => response as SetMailboxMetadataResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetMailboxMetadataRequest': request!.toMap(),
      };
}
