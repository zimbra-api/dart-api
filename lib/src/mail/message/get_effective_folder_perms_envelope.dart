// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_effective_folder_perms_body.dart';

class GetEffectiveFolderPermsEnvelope extends SoapEnvelope {
  GetEffectiveFolderPermsEnvelope(GetEffectiveFolderPermsBody body, {super.header}) : super(body);

  factory GetEffectiveFolderPermsEnvelope.fromJson(Map<String, dynamic> json) =>
      GetEffectiveFolderPermsEnvelope(GetEffectiveFolderPermsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetEffectiveFolderPermsBody get getEffectiveFolderPermsBody => body as GetEffectiveFolderPermsBody;
}
