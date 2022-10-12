// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/pref.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetPrefsResponse extends SoapResponse {
  /// Preferences
  final List<Pref> prefs;

  GetPrefsResponse({this.prefs = const []});

  factory GetPrefsResponse.fromJson(Map<String, dynamic> json) => GetPrefsResponse(
      prefs: (json['pref'] is Iterable)
          ? List.from((json['pref'] as Iterable).map<Pref>((pref) => Pref.fromJson(pref)))
          : []);
}
