// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'imap_copy_request.dart';
import 'imap_copy_response.dart';

class IMAPCopyBody extends SoapBody {
  IMAPCopyBody({IMAPCopyRequest? request, IMAPCopyResponse? response, super.fault})
      : super(request: request, response: response);

  factory IMAPCopyBody.fromJson(Map<String, dynamic> json) => IMAPCopyBody(
      response: json['IMAPCopyResponse'] != null ? IMAPCopyResponse.fromJson(json['IMAPCopyResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  IMAPCopyRequest? get imapCopyRequest => request as IMAPCopyRequest?;

  IMAPCopyResponse? get imapCopyResponse => response as IMAPCopyResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'IMAPCopyRequest': request!.toJson(),
      };
}