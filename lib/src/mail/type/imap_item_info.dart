// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IMAPItemInfo {
  /// Message ID
  final int? id;

  /// IMAP UID
  final int? imapUid;

  IMAPItemInfo({this.id, this.imapUid});

  factory IMAPItemInfo.fromJson(Map<String, dynamic> json) => IMAPItemInfo(id: json['id'], imapUid: json['i4uid']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (imapUid != null) 'i4uid': imapUid,
      };
}
