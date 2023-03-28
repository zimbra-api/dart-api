// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class PurgeRevisionSpec {
  /// Item ID
  final String id;

  /// Revision
  final int version;

  /// When set, the server will purge all the old revisions inclusive of the revision specified in the request.
  final bool? includeOlderRevisions;

  const PurgeRevisionSpec(this.id, this.version, {this.includeOlderRevisions});

  factory PurgeRevisionSpec.fromMap(
    Map<String, dynamic> data,
  ) =>
      PurgeRevisionSpec(
        data['id'] ?? '',
        int.tryParse(data['ver']?.toString() ?? '') ?? 0,
        includeOlderRevisions: data['includeOlderRevisions'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'ver': version,
        if (includeOlderRevisions != null) 'includeOlderRevisions': includeOlderRevisions,
      };
}
