// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_search_folder_request.dart';
import 'modify_search_folder_response.dart';

class ModifySearchFolderBody extends SoapBody {
  ModifySearchFolderBody({ModifySearchFolderRequest? request, ModifySearchFolderResponse? response})
      : super(request: request, response: response);

  factory ModifySearchFolderBody.fromMap(Map<String, dynamic> data) => ModifySearchFolderBody(
      response: data['ModifySearchFolderResponse'] != null
          ? ModifySearchFolderResponse.fromMap(data['ModifySearchFolderResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifySearchFolderRequest': request!.toMap(),
      };
}
