// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/misspelling.dart';

class CheckSpellingResponse extends SoapResponse {
  /// The "available" attribute specifies whether the server-side spell checking
  /// interface is available or not.
  final bool available;

  /// Information for misspelled words
  final List<Misspelling> misspelledWords;

  CheckSpellingResponse({this.available = false, this.misspelledWords = const []});

  factory CheckSpellingResponse.fromMap(Map<String, dynamic> data) => CheckSpellingResponse(
      available: data['available'] ?? false,
      misspelledWords: (data['misspelled'] is Iterable)
          ? (data['misspelled'] as Iterable)
              .map<Misspelling>((misspelled) => Misspelling.fromMap(misspelled))
              .toList(growable: false)
          : const []);
}
