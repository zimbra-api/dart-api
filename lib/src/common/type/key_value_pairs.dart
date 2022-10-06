// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'key_value_pair.dart';

class KeyValuePairs {
  final List<KeyValuePair> keyValuePairs;

  KeyValuePairs({this.keyValuePairs = const <KeyValuePair>[]});

  static List<KeyValuePair> keyValuePairsFromJson(Map<String, dynamic> json) {
    final keyValuePairs = <KeyValuePair>[];
    if (json['a'] != null && json['a'] is Iterable) {
      final attrs = json['a'] as Iterable;
      for (final attr in attrs) {
        keyValuePairs.add(KeyValuePair.fromJson(attr));
      }
    }
    return keyValuePairs;
  }

  Map<String, dynamic> toJson() => {
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toJson()),
      };
}
