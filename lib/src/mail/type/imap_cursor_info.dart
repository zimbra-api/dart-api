// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ImapCursorInfo {
  /// ID of the last IMAP item of the last page returned by OpenImapFolderRequest.
  /// If this item is deleted, the cursor is cleared.
  final String id;

  ImapCursorInfo(this.id);

  factory ImapCursorInfo.fromJson(Map<String, dynamic> json) => ImapCursorInfo(json['id'] ?? '');

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
