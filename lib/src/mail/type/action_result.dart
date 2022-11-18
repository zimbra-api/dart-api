// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Action response
class ActionResult {
  /// Comma-separated list of ids which have been successfully processed
  final String id;

  /// Operation
  final String operation;

  /// Comma-separated list of non-existent ids (if requested)
  final String? nonExistentIds;

  /// Comma-separated list of newly created ids (if requested)
  final String? newlyCreatedIds;

  const ActionResult(this.id, this.operation, {this.nonExistentIds, this.newlyCreatedIds});

  factory ActionResult.fromMap(Map<String, dynamic> data) =>
      ActionResult(data['id'] ?? '', data['op'] ?? '', nonExistentIds: data['nei'], newlyCreatedIds: data['nci']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'op': operation,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
      };
}
