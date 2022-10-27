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

  factory SetMailboxMetadataBody.fromJson(Map<String, dynamic> json) => SetMailboxMetadataBody(
      response: json['SetMailboxMetadataResponse'] != null
          ? SetMailboxMetadataResponse.fromJson(json['SetMailboxMetadataResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SetMailboxMetadataRequest? get setMailboxMetadataRequest => request as SetMailboxMetadataRequest?;

  SetMailboxMetadataResponse? get setMailboxMetadataResponse => response as SetMailboxMetadataResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SetMailboxMetadataRequest': request!.toJson(),
      };
}
