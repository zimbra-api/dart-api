// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IMAPItemInfo {
  /// Message ID
  final int? id;

  /// IMAP UID
  final int? imapUid;

  const IMAPItemInfo({this.id, this.imapUid});

  factory IMAPItemInfo.fromMap(Map<String, dynamic> data) => IMAPItemInfo(
        id: data['id'],
        imapUid: int.tryParse(data['i4uid']?.toString() ?? ''),
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (imapUid != null) 'i4uid': imapUid,
      };
}
