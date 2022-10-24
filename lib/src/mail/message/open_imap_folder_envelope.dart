// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'open_imap_folder_body.dart';

class OpenIMAPFolderEnvelope extends SoapEnvelope {
  OpenIMAPFolderEnvelope(OpenIMAPFolderBody body, {super.header}) : super(body);

  factory OpenIMAPFolderEnvelope.fromJson(Map<String, dynamic> json) =>
      OpenIMAPFolderEnvelope(OpenIMAPFolderBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  OpenIMAPFolderBody get openIMAPFolderBody => body as OpenIMAPFolderBody;
}
