// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'type/attr.dart';
import 'type/pref.dart';

class Utils {
  static List<Attr> attrsFromMap(Map<String, dynamic> data) {
    final attrs = <Attr>[];
    for (final entry in data.entries) {
      if (entry.value is Iterable) {
        attrs.addAll((entry.value as Iterable).map<Attr>((value) => Attr(entry.key, value: value)));
      } else {
        attrs.add(Attr(entry.key, value: entry.value));
      }
    }
    return attrs.toList(growable: false);
  }

  static List<Pref> prefsFromMap(Map<String, dynamic> data) {
    final prefs = <Pref>[];
    for (final entry in data.entries) {
      if (entry.value is Iterable) {
        prefs.addAll((entry.value as Iterable).map<Pref>((value) => Pref(entry.key, value: value)));
      } else {
        prefs.add(Pref(entry.key, value: entry.value));
      }
    }
    return prefs.toList(growable: false);
  }
}
