// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_prefs_body.dart';
import 'get_prefs_envelope.dart';

/// Get preferences for the authenticated account
/// If no <pref> elements are provided, all known prefs are returned in the response.
/// If <pref> elements are provided, only those prefs are returned in the response.
class GetPrefsRequest extends SoapRequest {
  /// If any of these are specified then only get these preferences
  final List<Pref> prefs;

  GetPrefsRequest({this.prefs = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetPrefsEnvelope(GetPrefsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (prefs.isNotEmpty) 'pref': prefs.map((pref) => pref.toJson()).toList(),
      };
}
