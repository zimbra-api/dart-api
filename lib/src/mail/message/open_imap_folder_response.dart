// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/imap_cursor_info.dart';
import '../type/imap_message_info.dart';

class OpenIMAPFolderResponse extends SoapResponse {
  /// Flag whether can be cached
  final bool? hasMore;

  /// Messages
  final List<ImapMessageInfo> messages;

  /// Cursor to be used by the next request, if more results exist
  final ImapCursorInfo? cursor;

  OpenIMAPFolderResponse({this.hasMore, this.messages = const [], this.cursor});

  factory OpenIMAPFolderResponse.fromMap(Map<String, dynamic> data) => OpenIMAPFolderResponse(
        hasMore: data['more'],
        messages: (data['folder']?[0]['m'] is Iterable)
            ? (data['folder'][0]['m'] as Iterable)
                .map<ImapMessageInfo>((m) => ImapMessageInfo.fromMap(m))
                .toList(growable: false)
            : const [],
        cursor: data['cursor'] is Map ? ImapCursorInfo.fromMap(data['cursor']) : null,
      );
}
