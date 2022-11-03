// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/bulk_operation.dart';

class BulkAction {
  /// Operation to perform
  /// - move: move the search result to specified folder location
  /// - read: mark the search result as read
  /// - unread: mark the search result as unread
  final BulkOperation operation;

  /// Folder
  /// Required if op="move". Folder pathname where all matching items should be moved.
  final String? folder;

  BulkAction({this.operation = BulkOperation.read, this.folder});

  factory BulkAction.fromMap(Map<String, dynamic> data) => BulkAction(
      operation: BulkOperation.values.firstWhere(
        (op) => op.name == data['op'],
        orElse: () => BulkOperation.read,
      ),
      folder: data['l']);

  Map<String, dynamic> toMap() => {
        'op': operation.name,
        if (folder != null) 'l': folder,
      };
}
