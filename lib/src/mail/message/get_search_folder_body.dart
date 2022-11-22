// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_search_folder_request.dart';
import 'get_search_folder_response.dart';

class GetSearchFolderBody extends SoapBody {
  GetSearchFolderBody({GetSearchFolderRequest? request, GetSearchFolderResponse? response})
      : super(request: request, response: response);

  factory GetSearchFolderBody.fromMap(Map<String, dynamic> data) => GetSearchFolderBody(
      response: data['GetSearchFolderResponse'] != null
          ? GetSearchFolderResponse.fromMap(data['GetSearchFolderResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetSearchFolderRequest': request!.toMap(),
      };
}
