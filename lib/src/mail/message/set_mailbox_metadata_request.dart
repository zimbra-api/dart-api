// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

import 'set_mailbox_metadata_body.dart';
import 'set_mailbox_metadata_envelope.dart';

/// Set mailbox metadata
/// - Setting a mailbox metadata section but providing no key/value pairs will remove the section from mailbox metadata
/// - Empty value not allowed
/// - {metadata-section-key} must be no more than 36 characters long
///   and must be in the format of {namespace}:{section-name}.
///   currently the only valid namespace is "zwc".
class SetMailboxMetadataRequest extends SoapRequest {
  /// New metadata information
  final MailCustomMetadata metadata;

  SetMailboxMetadataRequest(this.metadata);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SetMailboxMetadataEnvelope(SetMailboxMetadataBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'meta': metadata.toMap(),
      };
}
