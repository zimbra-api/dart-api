// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/pref.dart';
import '../utils.dart';

class GetPrefsResponse extends SoapResponse {
  /// Preferences
  final List<Pref> prefs;

  GetPrefsResponse({this.prefs = const []});

  factory GetPrefsResponse.fromMap(Map<String, dynamic> data) => GetPrefsResponse(
      prefs: (data['_attrs'] is Map) ? Utils.prefsFromMap(data['_attrs'] as Map<String, dynamic>) : const []);
}
