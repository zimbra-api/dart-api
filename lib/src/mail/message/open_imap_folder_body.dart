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

  factory OpenIMAPFolderBody.fromMap(Map<String, dynamic> data) => OpenIMAPFolderBody(
      response: data['OpenIMAPFolderResponse'] != null
          ? OpenIMAPFolderResponse.fromMap(data['OpenIMAPFolderResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'OpenIMAPFolderRequest': request!.toMap(),
      };
}
