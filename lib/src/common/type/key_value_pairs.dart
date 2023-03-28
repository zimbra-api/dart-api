// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'key_value_pair.dart';

class KeyValuePairs {
  final List<KeyValuePair> keyValuePairs;

  const KeyValuePairs({this.keyValuePairs = const []});

  static List<KeyValuePair> keyValuePairsFromMap(Map<String, dynamic> data) {
    return (data['_attrs'] is Map)
        ? attrsFromMap(
            data['_attrs'] as Map<String, dynamic>,
          )
        : const [];
  }

  static List<KeyValuePair> attrsFromMap(Map<String, dynamic> data) {
    final attrs = <KeyValuePair>[];
    for (final entry in data.entries) {
      if (entry.value is Iterable) {
        attrs.addAll(
          (entry.value as Iterable).map<KeyValuePair>(
            (value) => KeyValuePair(entry.key, value: value),
          ),
        );
      } else {
        attrs.add(KeyValuePair(entry.key, value: entry.value));
      }
    }
    return attrs.toList(growable: false);
  }

  Map<String, dynamic> toMap() => {
        if (keyValuePairs.isNotEmpty)
          'a': keyValuePairs
              .map(
                (kvp) => kvp.toMap(),
              )
              .toList(
                growable: false,
              ),
      };
}
