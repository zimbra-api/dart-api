// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/search_folder.dart';

class CreateSearchFolderResponse extends SoapResponse {
  /// Details of newly created search folder
  final SearchFolder? searchFolder;

  CreateSearchFolderResponse({this.searchFolder});

  factory CreateSearchFolderResponse.fromJson(Map<String, dynamic> json) =>
      CreateSearchFolderResponse(searchFolder: json['search'] is Map ? SearchFolder.fromJson(json['search']) : null);
}
