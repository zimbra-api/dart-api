// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/section_attr.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_mailbox_metadata_body.dart';
import 'get_mailbox_metadata_envelope.dart';

/// Get mailbox metadata
class GetMailboxMetadataRequest extends SoapRequest {
  /// Metadata section specification
  final SectionAttr metadata;

  GetMailboxMetadataRequest(this.metadata);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetMailboxMetadataEnvelope(GetMailboxMetadataBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'meta': metadata.toJson(),
      };
}
