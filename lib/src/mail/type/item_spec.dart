// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ItemSpec {
  /// Item ID
  final String? id;

  /// Folder ID
  final String? folder;

  /// Name
  final String? name;

  /// Fully qualified path
  final String? path;

  const ItemSpec({this.id, this.folder, this.name, this.path});

  factory ItemSpec.fromMap(Map<String, dynamic> data) =>
      ItemSpec(id: data['id'], folder: data['l'], name: data['name'], path: data['path']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (folder != null) 'l': folder,
        if (name != null) 'name': name,
        if (path != null) 'path': path,
      };
}
