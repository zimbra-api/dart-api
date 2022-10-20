// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FolderSpec {
  ///Folder ID
  final String folder;

  FolderSpec({this.folder = ''});

  factory FolderSpec.fromJson(Map<String, dynamic> json) => FolderSpec(folder: json['l'] ?? '');

  Map<String, dynamic> toJson() => {
        'l': folder,
      };
}
