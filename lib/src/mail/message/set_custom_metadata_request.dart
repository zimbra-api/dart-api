// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

import 'set_custom_metadata_body.dart';
import 'set_custom_metadata_envelope.dart';

/// Set custom metadata
/// Setting a custom metadata section but providing no key/value pairs will remove the sction from the item
class SetCustomMetadataRequest extends SoapRequest {
  /// New metadata information
  final MailCustomMetadata metadata;

  /// Item ID
  final String? id;

  SetCustomMetadataRequest(this.metadata, {this.id});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SetCustomMetadataEnvelope(SetCustomMetadataBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'meta': metadata.toMap(),
        if (id != null) 'id': id,
      };
}
