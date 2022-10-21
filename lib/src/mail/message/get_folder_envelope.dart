// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_folder_body.dart';

class GetFolderEnvelope extends SoapEnvelope {
  GetFolderEnvelope(GetFolderBody body, {super.header}) : super(body);

  factory GetFolderEnvelope.fromJson(Map<String, dynamic> json) =>
      GetFolderEnvelope(GetFolderBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetFolderBody get getFolderBody => body as GetFolderBody;
}
