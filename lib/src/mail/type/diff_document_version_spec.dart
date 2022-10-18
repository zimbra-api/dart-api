// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DiffDocumentVersionSpec {
  /// ID
  final String id;

  /// Revision 1
  final int? version1;

  /// Revision 2
  final int? version2;

  DiffDocumentVersionSpec(this.id, {this.version1, this.version2});

  factory DiffDocumentVersionSpec.fromJson(Map<String, dynamic> json) =>
      DiffDocumentVersionSpec(json['id'] ?? '', version1: json['v1'], version2: json['v2']);

  Map<String, dynamic> toJson() => {
        'id': id,
        if (version1 != null) 'v1': version1,
        if (version2 != null) 'v2': version2,
      };
}
