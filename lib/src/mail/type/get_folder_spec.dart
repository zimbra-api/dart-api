// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Get folder input spec
class GetFolderSpec {
  /// Base folder UUID
  final String? uuid;

  /// Base folder ID
  final String? folderId;

  /// Base folder fully qualified path
  final String? path;

  GetFolderSpec({this.uuid, this.folderId, this.path});

  factory GetFolderSpec.fromJson(Map<String, dynamic> json) =>
      GetFolderSpec(uuid: json['uuid'], folderId: json['l'], path: json['path']);

  Map<String, dynamic> toJson() => {
        if (uuid != null) 'uuid': uuid,
        if (folderId != null) 'l': folderId,
        if (path != null) 'path': path,
      };
}
