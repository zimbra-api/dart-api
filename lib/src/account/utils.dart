// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/contact_attr.dart';

import 'type/attr.dart';
import 'type/pref.dart';

class Utils {
  static List<Attr> attrsFromJson(Map<String, dynamic> json) {
    final attrs = <Attr>[];
    for (final entry in json.entries) {
      if (entry.value is Iterable) {
        attrs.addAll((entry.value as Iterable).map<Attr>((value) => Attr(entry.key, value: value)));
      } else {
        attrs.add(Attr(entry.key, value: entry.value));
      }
    }
    return attrs;
  }

  static List<Pref> prefsFromJson(Map<String, dynamic> json) {
    final prefs = <Pref>[];
    for (final entry in json.entries) {
      if (entry.value is Iterable) {
        prefs.addAll((entry.value as Iterable).map<Pref>((value) => Pref(entry.key, value: value)));
      } else {
        prefs.add(Pref(entry.key, value: entry.value));
      }
    }
    return prefs;
  }

  static List<ContactAttr> contactAttrsFromJson(Map<String, dynamic> json) {
    final attrs = <ContactAttr>[];
    for (final entry in json.entries) {
      if (entry.value is Iterable) {
        attrs.addAll((entry.value as Iterable).map<ContactAttr>((value) => ContactAttr(entry.key, value: value)));
      } else {
        attrs.add(ContactAttr(entry.key, value: entry.value));
      }
    }
    return attrs;
  }
}
