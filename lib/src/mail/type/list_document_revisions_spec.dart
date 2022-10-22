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

  factory ListDocumentRevisionsSpec.fromJson(Map<String, dynamic> json) =>
      ListDocumentRevisionsSpec(id: json['id'], version: json['ver'], count: json['count']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (version != null) 'ver': version,
        if (count != null) 'count': count,
      };
}
