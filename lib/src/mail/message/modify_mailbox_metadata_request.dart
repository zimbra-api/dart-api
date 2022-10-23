// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

import 'modify_mailbox_metadata_body.dart';
import 'modify_mailbox_metadata_envelope.dart';

/// Modify mailbox metadata
/// - Modify request must contain one or more key/value pairs
/// - Existing keys' values will be replaced by new values
/// - Empty or null value will remove a key
/// - New keys can be added
class ModifyMailboxMetadataRequest extends SoapRequest {
  /// Metadata changes
  final MailCustomMetadata metadata;

  ModifyMailboxMetadataRequest(this.metadata);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyMailboxMetadataEnvelope(ModifyMailboxMetadataBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'meta': metadata.toJson(),
      };
}
