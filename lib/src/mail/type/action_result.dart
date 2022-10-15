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

  ActionResult(this.id, this.operation, {this.nonExistentIds, this.newlyCreatedIds});

  factory ActionResult.fromJson(Map<String, dynamic> json) =>
      ActionResult(json['id'] ?? '', json['op'] ?? '', nonExistentIds: json['nei'], newlyCreatedIds: json['nci']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'op': operation,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
      };
}
