// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_folder_request.dart';
import 'get_folder_response.dart';

class GetFolderBody extends SoapBody {
  GetFolderBody({GetFolderRequest? request, GetFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetFolderBody.fromMap(Map<String, dynamic> data) => GetFolderBody(
      response: data['GetFolderResponse'] != null ? GetFolderResponse.fromMap(data['GetFolderResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetFolderRequest': request!.toMap(),
      };
}
