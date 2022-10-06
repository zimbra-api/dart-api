// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_zimlet_prefs_body.dart';

class ModifyZimletPrefsEnvelope extends SoapEnvelope {
  ModifyZimletPrefsEnvelope(ModifyZimletPrefsBody body, {super.header}) : super(body);

  factory ModifyZimletPrefsEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifyZimletPrefsEnvelope(ModifyZimletPrefsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifyZimletPrefsBody get modifyZimletPrefsBody => body as ModifyZimletPrefsBody;
}
