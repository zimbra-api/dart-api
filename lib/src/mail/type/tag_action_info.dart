// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class TagActionInfo {
  /// Tag IDs for successfully applied operation
  final String successes;

  /// Operations of tags affected by successfully applied operation
  /// Only present if "tn" was specified in the request
  final String? successNames;

  /// Operation - "read|!read|color|delete|rename|update|retentionpolicy"
  final String? operation;

  const TagActionInfo(this.successes, {this.successNames, this.operation});

  factory TagActionInfo.fromMap(Map<String, dynamic> data) =>
      TagActionInfo(data['id'] ?? '', successNames: data['tn'], operation: data['op']);

  Map<String, dynamic> toMap() => {
        'id': successes,
        if (successNames != null) 'tn': successNames,
        if (operation != null) 'op': operation,
      };
}
