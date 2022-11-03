// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_mailbox_metadata_body.dart';

class GetMailboxMetadataEnvelope extends SoapEnvelope {
  GetMailboxMetadataEnvelope(GetMailboxMetadataBody body, {super.header}) : super(body);

  factory GetMailboxMetadataEnvelope.fromMap(Map<String, dynamic> data) =>
      GetMailboxMetadataEnvelope(GetMailboxMetadataBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetMailboxMetadataBody get getMailboxMetadataBody => body as GetMailboxMetadataBody;
}
