// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'folder_action_body.dart';

class FolderActionEnvelope extends SoapEnvelope {
  FolderActionEnvelope(FolderActionBody body, {super.header}) : super(body);

  factory FolderActionEnvelope.fromJson(Map<String, dynamic> json) =>
      FolderActionEnvelope(FolderActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  FolderActionBody get folderActionBody => body as FolderActionBody;
}
