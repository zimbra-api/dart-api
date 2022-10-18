// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'folder_action_request.dart';
import 'folder_action_response.dart';

class FolderActionBody extends SoapBody {
  FolderActionBody({FolderActionRequest? request, FolderActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory FolderActionBody.fromJson(Map<String, dynamic> json) => FolderActionBody(
      response:
          json['FolderActionResponse'] != null ? FolderActionResponse.fromJson(json['FolderActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  FolderActionRequest? get folderActionRequest => request as FolderActionRequest?;

  FolderActionResponse? get folderActionResponse => response as FolderActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'FolderActionRequest': request!.toJson(),
      };
}
