// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/msg_part_ids.dart';

import 'remove_attachments_body.dart';
import 'remove_attachments_envelope.dart';

/// Remove attachments from a message body
/// NOTE: that this operation is effectively a create and a delete, and thus the message's item ID will change
class RemoveAttachmentsRequest extends SoapRequest {
  /// Specification of parts to remove
  final MsgPartIds msg;

  RemoveAttachmentsRequest(this.msg);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      RemoveAttachmentsEnvelope(RemoveAttachmentsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toJson(),
      };
}
