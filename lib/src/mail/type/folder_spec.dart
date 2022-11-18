// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FolderSpec {
  ///Folder ID
  final String folder;

  const FolderSpec({this.folder = ''});

  factory FolderSpec.fromMap(Map<String, dynamic> data) => FolderSpec(folder: data['l'] ?? '');

  Map<String, dynamic> toMap() => {
        'l': folder,
      };
}
