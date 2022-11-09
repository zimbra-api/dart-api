// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ListDocumentRevisionsSpec {
  /// Item ID
  final String? id;

  /// Version
  final int? version;

  /// Maximum number of revisions to return starting from <version>
  final int? count;

  ListDocumentRevisionsSpec({this.id, this.version, this.count});

  factory ListDocumentRevisionsSpec.fromMap(Map<String, dynamic> data) => ListDocumentRevisionsSpec(
      id: data['id'],
      version: int.tryParse(data['ver']?.toString() ?? ''),
      count: int.tryParse(data['count']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
        if (count != null) 'count': count,
      };
}
