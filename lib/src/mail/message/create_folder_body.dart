// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_folder_request.dart';
import 'create_folder_response.dart';

class CreateFolderBody extends SoapBody {
  CreateFolderBody({CreateFolderRequest? request, CreateFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateFolderBody.fromJson(Map<String, dynamic> json) => CreateFolderBody(
      response:
          json['CreateFolderResponse'] != null ? CreateFolderResponse.fromJson(json['CreateFolderResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateFolderRequest? get createFolderRequest => request as CreateFolderRequest?;

  CreateFolderResponse? get createFolderResponse => response as CreateFolderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateFolderRequest': request!.toJson(),
      };
}
