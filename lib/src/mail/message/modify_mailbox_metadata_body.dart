// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_mailbox_metadata_request.dart';
import 'modify_mailbox_metadata_response.dart';

class ModifyMailboxMetadataBody extends SoapBody {
  ModifyMailboxMetadataBody(
      {ModifyMailboxMetadataRequest? request, ModifyMailboxMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyMailboxMetadataBody.fromJson(Map<String, dynamic> json) => ModifyMailboxMetadataBody(
      response: json['ModifyMailboxMetadataResponse'] != null
          ? ModifyMailboxMetadataResponse.fromJson(json['ModifyMailboxMetadataResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyMailboxMetadataRequest? get modifyMailboxMetadataRequest => request as ModifyMailboxMetadataRequest?;

  ModifyMailboxMetadataResponse? get modifyMailboxMetadataResponse => response as ModifyMailboxMetadataResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyMailboxMetadataRequest': request!.toJson(),
      };
}
