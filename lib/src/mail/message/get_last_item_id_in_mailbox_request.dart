// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_last_item_id_in_mailbox_body.dart';
import 'get_last_item_id_in_mailbox_envelope.dart';

/// Returns the last ID assigned to an item successfully created in the mailbox
class GetLastItemIdInMailboxRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetLastItemIdInMailboxEnvelope(GetLastItemIdInMailboxBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
      };
}
