// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_mailbox_metadata_request.dart';
import 'get_mailbox_metadata_response.dart';

class GetMailboxMetadataBody extends SoapBody {
  GetMailboxMetadataBody({GetMailboxMetadataRequest? request, GetMailboxMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetMailboxMetadataBody.fromJson(Map<String, dynamic> json) => GetMailboxMetadataBody(
      response: json['GetMailboxMetadataResponse'] != null
          ? GetMailboxMetadataResponse.fromJson(json['GetMailboxMetadataResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetMailboxMetadataRequest? get getMailboxMetadataRequest => request as GetMailboxMetadataRequest?;

  GetMailboxMetadataResponse? get getMailboxMetadataResponse => response as GetMailboxMetadataResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetMailboxMetadataRequest': request!.toJson(),
      };
}
