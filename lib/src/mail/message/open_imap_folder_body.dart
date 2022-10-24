// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'open_imap_folder_request.dart';
import 'open_imap_folder_response.dart';

class OpenIMAPFolderBody extends SoapBody {
  OpenIMAPFolderBody({OpenIMAPFolderRequest? request, OpenIMAPFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory OpenIMAPFolderBody.fromJson(Map<String, dynamic> json) => OpenIMAPFolderBody(
      response: json['OpenIMAPFolderResponse'] != null
          ? OpenIMAPFolderResponse.fromJson(json['OpenIMAPFolderResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  OpenIMAPFolderRequest? get openIMAPFolderRequest => request as OpenIMAPFolderRequest?;

  OpenIMAPFolderResponse? get openIMAPFolderResponse => response as OpenIMAPFolderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'OpenIMAPFolderRequest': request!.toJson(),
      };
}
