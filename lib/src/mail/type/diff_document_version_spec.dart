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

  const DiffDocumentVersionSpec(this.id, {this.version1, this.version2});

  factory DiffDocumentVersionSpec.fromMap(Map<String, dynamic> data) => DiffDocumentVersionSpec(data['id'] ?? '',
      version1: int.tryParse(data['v1']?.toString() ?? ''), version2: int.tryParse(data['v2']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        'id': id,
        if (version1 != null) 'v1': version1,
        if (version2 != null) 'v2': version2,
      };
}
