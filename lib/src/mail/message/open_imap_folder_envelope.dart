// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'open_imap_folder_body.dart';

class OpenIMAPFolderEnvelope extends SoapEnvelope {
  OpenIMAPFolderEnvelope(OpenIMAPFolderBody body, {super.header}) : super(body);

  factory OpenIMAPFolderEnvelope.fromMap(Map<String, dynamic> data) =>
      OpenIMAPFolderEnvelope(OpenIMAPFolderBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  OpenIMAPFolderBody get openIMAPFolderBody => body as OpenIMAPFolderBody;
}
