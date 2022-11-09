// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'imap_item_info.dart';

class ImapMessageInfo extends IMAPItemInfo {
  /// Item type
  final String? type;

  /// Flags
  final String? flags;

  /// Comma separated list of name of tags associated with this item
  final String? tags;

  ImapMessageInfo({super.id, super.imapUid, this.type, this.flags, this.tags});

  factory ImapMessageInfo.fromMap(Map<String, dynamic> data) => ImapMessageInfo(
      id: data['id'],
      imapUid: int.tryParse(data['i4uid']?.toString() ?? ''),
      type: data['t'],
      flags: data['f'],
      tags: data['tn']);

  @override
  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (imapUid != null) 'i4uid': imapUid,
        if (type != null) 't': type,
        if (flags != null) 'f': flags,
        if (tags != null) 'tn': tags,
      };
}
