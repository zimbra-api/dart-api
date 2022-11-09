// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class RecordIMAPSessionResponse extends SoapResponse {
  /// ID of last item created in mailbox
  final int? lastItemId;

  /// UUID of the affected Folder
  final String? folderUuid;

  RecordIMAPSessionResponse({this.lastItemId, this.folderUuid});

  factory RecordIMAPSessionResponse.fromMap(Map<String, dynamic> data) =>
      RecordIMAPSessionResponse(lastItemId: int.tryParse(data['id']?.toString() ?? ''), folderUuid: data['luuid']);
}
