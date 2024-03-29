// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'get_last_item_id_in_mailbox_body.dart';

class GetLastItemIdInMailboxEnvelope extends SoapEnvelope {
  GetLastItemIdInMailboxEnvelope(
    GetLastItemIdInMailboxBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory GetLastItemIdInMailboxEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetLastItemIdInMailboxEnvelope(
        GetLastItemIdInMailboxBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}
