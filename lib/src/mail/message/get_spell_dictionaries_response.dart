// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetSpellDictionariesResponse extends SoapResponse {
  /// Dictionaries
  final List<String> dictionaries;

  GetSpellDictionariesResponse({this.dictionaries = const []});

  factory GetSpellDictionariesResponse.fromJson(Map<String, dynamic> json) => GetSpellDictionariesResponse(
      dictionaries: (json['dictionary'] is Iterable)
          ? List.from((json['dictionary'] as Iterable).map<String>((dictionary) => dictionary['_content']))
          : []);
}
