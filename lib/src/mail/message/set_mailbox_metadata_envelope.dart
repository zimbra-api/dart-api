// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'set_mailbox_metadata_body.dart';

class SetMailboxMetadataEnvelope extends SoapEnvelope {
  SetMailboxMetadataEnvelope(SetMailboxMetadataBody body, {super.header}) : super(body..response?.header = header);

  factory SetMailboxMetadataEnvelope.fromMap(Map<String, dynamic> data) =>
      SetMailboxMetadataEnvelope(SetMailboxMetadataBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  SetMailboxMetadataBody get setMailboxMetadataBody => body as SetMailboxMetadataBody;
}
