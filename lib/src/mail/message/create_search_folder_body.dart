// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_search_folder_request.dart';
import 'create_search_folder_response.dart';

class CreateSearchFolderBody extends SoapBody {
  CreateSearchFolderBody({CreateSearchFolderRequest? request, CreateSearchFolderResponse? response})
      : super(request: request, response: response);

  factory CreateSearchFolderBody.fromMap(Map<String, dynamic> data) => CreateSearchFolderBody(
      response: data['CreateSearchFolderResponse'] != null
          ? CreateSearchFolderResponse.fromMap(data['CreateSearchFolderResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateSearchFolderRequest': request!.toMap(),
      };
}
