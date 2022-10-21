// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/mountpoint.dart';
import 'package:zimbra_api/src/mail/type/search_folder.dart';

class GetFolderResponse extends SoapResponse {
  /// Information about folder
  final Folder? folder;

  /// Information about mountpoint
  final Mountpoint? mountpoint;

  /// Information about search folder
  final SearchFolder? searchFolder;

  GetFolderResponse({this.folder, this.mountpoint, this.searchFolder});

  factory GetFolderResponse.fromJson(Map<String, dynamic> json) => GetFolderResponse(
      folder: json['folder'] is Map ? Folder.fromJson(json['folder']) : null,
      mountpoint: json['link'] is Map ? Mountpoint.fromJson(json['link']) : null,
      searchFolder: json['search'] is Map ? SearchFolder.fromJson(json['search']) : null);
}
