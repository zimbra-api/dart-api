// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/auto_complete_match.dart';

class AutoCompleteResponse extends SoapResponse {
  /// Matches
  final List<AutoCompleteMatch> matches;

  /// Flag whether can be cached
  final bool? canBeCached;

  AutoCompleteResponse({this.matches = const [], this.canBeCached});

  factory AutoCompleteResponse.fromMap(Map<String, dynamic> data) => AutoCompleteResponse(
      matches: (data['match'] is Iterable)
          ? (data['match'] as Iterable)
              .map<AutoCompleteMatch>((match) => AutoCompleteMatch.fromMap(match))
              .toList(growable: false)
          : const [],
      canBeCached: data['canBeCached']);
}
