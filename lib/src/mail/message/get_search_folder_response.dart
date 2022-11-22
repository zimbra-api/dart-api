// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/search_folder.dart';

class GetSearchFolderResponse extends SoapResponse {
  /// Search folder information
  final List<SearchFolder> searchFolders;

  GetSearchFolderResponse({this.searchFolders = const []});

  factory GetSearchFolderResponse.fromMap(Map<String, dynamic> data) => GetSearchFolderResponse(
      searchFolders: (data['search'] is Iterable)
          ? (data['search'] as Iterable)
              .map<SearchFolder>((search) => SearchFolder.fromMap(search))
              .toList(growable: false)
          : const []);
}
