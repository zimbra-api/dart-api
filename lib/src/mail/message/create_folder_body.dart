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

  factory CreateFolderBody.fromMap(Map<String, dynamic> data) => CreateFolderBody(
      response:
          data['CreateFolderResponse'] != null ? CreateFolderResponse.fromMap(data['CreateFolderResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateFolderRequest': request!.toMap(),
      };
}
