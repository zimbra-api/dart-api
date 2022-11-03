// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_search_folder_request.dart';
import 'modify_search_folder_response.dart';

class ModifySearchFolderBody extends SoapBody {
  ModifySearchFolderBody({ModifySearchFolderRequest? request, ModifySearchFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifySearchFolderBody.fromMap(Map<String, dynamic> data) => ModifySearchFolderBody(
      response: data['ModifySearchFolderResponse'] != null
          ? ModifySearchFolderResponse.fromMap(data['ModifySearchFolderResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ModifySearchFolderRequest? get modifySearchFolderRequest => request as ModifySearchFolderRequest?;

  ModifySearchFolderResponse? get modifySearchFolderResponse => response as ModifySearchFolderResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifySearchFolderRequest': request!.toMap(),
      };
}
