// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'key_value_pair.dart';

class KeyValuePairs {
  final List<KeyValuePair> keyValuePairs;

  KeyValuePairs({this.keyValuePairs = const []});

  static List<KeyValuePair> keyValuePairsFromJson(Map<String, dynamic> json) {
    return (json['a'] is Iterable)
        ? List.from((json['a'] as Iterable).map<KeyValuePair>((kvp) => KeyValuePair.fromJson(kvp)))
        : [];
  }

  Map<String, dynamic> toJson() => {
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toJson()).toList(),
      };
}
