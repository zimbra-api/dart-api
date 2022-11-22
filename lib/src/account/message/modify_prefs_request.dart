// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/pref.dart';
import 'modify_prefs_body.dart';
import 'modify_prefs_envelope.dart';

/// Modify Preferences
/// Notes:
/// For multi-value prefs, just add the same attribute with 'n' different values
/// You can also add/subtract single values to/from a multi-value pref by prefixing
/// the preference name with a '+' or '-', respectively in the same way you do when using zmprov.
class ModifyPrefsRequest extends SoapRequest {
  /// Specify the preferences to be modified
  final List<Pref> prefs;

  ModifyPrefsRequest({this.prefs = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ModifyPrefsEnvelope(ModifyPrefsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (prefs.isNotEmpty) 'pref': prefs.map((pref) => pref.toMap()).toList(growable: false),
      };
}
