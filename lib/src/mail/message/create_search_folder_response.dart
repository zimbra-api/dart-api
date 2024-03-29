// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/search_folder.dart';

class CreateSearchFolderResponse extends SoapResponse {
  /// Details of newly created search folder
  final SearchFolder? searchFolder;

  CreateSearchFolderResponse({this.searchFolder});

  factory CreateSearchFolderResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateSearchFolderResponse(
        searchFolder: data['search'] is Map
            ? SearchFolder.fromMap(
                data['search'],
              )
            : null,
      );
}
