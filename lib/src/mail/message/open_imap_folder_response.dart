// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/imap_cursor_info.dart';
import 'package:zimbra_api/src/mail/type/imap_message_info.dart';

class OpenIMAPFolderResponse extends SoapResponse {
  /// Flag whether can be cached
  final bool? hasMore;

  /// Messages
  final List<ImapMessageInfo> messages;

  /// Cursor to be used by the next request, if more results exist
  final ImapCursorInfo? cursor;

  OpenIMAPFolderResponse({this.hasMore, this.messages = const [], this.cursor});

  factory OpenIMAPFolderResponse.fromJson(Map<String, dynamic> json) => OpenIMAPFolderResponse(
        hasMore: json['more'],
        messages: (json['folder']?['m'] is Iterable)
            ? List.from((json['folder']['m'] as Iterable).map<ImapMessageInfo>((m) => ImapMessageInfo.fromJson(m)))
            : [],
        cursor: json['cursor'] is Map ? ImapCursorInfo.fromJson(json['cursor']) : null,
      );
}
