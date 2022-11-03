// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/modify_zimlet_prefs_spec.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'modify_zimlet_prefs_body.dart';
import 'modify_zimlet_prefs_envelope.dart';

/// Modify zimlet preferences
class ModifyZimletPrefsRequest extends SoapRequest {
  /// Zimlet Preference Specifications
  final List<ModifyZimletPrefsSpec> zimlets;

  ModifyZimletPrefsRequest({this.zimlets = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyZimletPrefsEnvelope(ModifyZimletPrefsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (zimlets.isNotEmpty) 'zimlet': zimlets.map((zimlet) => zimlet.toMap()).toList(),
      };
}
