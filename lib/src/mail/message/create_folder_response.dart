// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/mountpoint.dart';
import 'package:zimbra_api/src/mail/type/search_folder.dart';

class CreateFolderResponse extends SoapResponse {
  /// Information about created folder
  final Folder? folder;

  /// Information about created mountpoint
  final Mountpoint? mountpoint;

  /// Information about created search folder
  final SearchFolder? searchFolder;

  CreateFolderResponse({this.folder, this.mountpoint, this.searchFolder});

  factory CreateFolderResponse.fromMap(Map<String, dynamic> data) => CreateFolderResponse(
      folder: data['folder'] is Map ? Folder.fromMap(data['folder']) : null,
      mountpoint: data['link'] is Map ? Mountpoint.fromMap(data['link']) : null,
      searchFolder: data['search'] is Map ? SearchFolder.fromMap(data['search']) : null);
}
