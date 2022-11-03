// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/ids_attr.dart';

import 'get_msg_metadata_body.dart';
import 'get_msg_metadata_envelope.dart';

/// Get message metadata
class GetMsgMetadataRequest extends SoapRequest {
  /// Messages selector
  final IdsAttr msgIds;

  GetMsgMetadataRequest(this.msgIds);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetMsgMetadataEnvelope(GetMsgMetadataBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'm': msgIds.toMap(),
      };
}
