// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/imap_cursor_info.dart';

import 'open_imap_folder_body.dart';
import 'open_imap_folder_envelope.dart';

class OpenIMAPFolderRequest extends SoapRequest {
  /// The ID of the folder to open
  final String folderId;

  /// The maximum number of results to return
  final int limit;

  /// Cursor specifying the last item on the previous results page
  final ImapCursorInfo? cursor;

  OpenIMAPFolderRequest(this.folderId, this.limit, {this.cursor});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      OpenIMAPFolderEnvelope(OpenIMAPFolderBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'l': folderId,
        'limit': limit,
        if (cursor != null) 'cursor': cursor!.toMap(),
      };
}
