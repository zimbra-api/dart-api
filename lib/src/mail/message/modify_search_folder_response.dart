// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/search_folder.dart';

class ModifySearchFolderResponse extends SoapResponse {
  /// Information about search folder, if and only if Search folder was modified.
  final SearchFolder? searchFolder;

  ModifySearchFolderResponse({this.searchFolder});

  factory ModifySearchFolderResponse.fromMap(Map<String, dynamic> data) =>
      ModifySearchFolderResponse(searchFolder: data['search'] is Map ? SearchFolder.fromMap(data['search']) : null);
}
