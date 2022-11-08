// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attr.dart';

abstract class Attrs {
  final List<Attr> attrs;

  Attrs({this.attrs = const []});

  static List<Attr> attrsFromMap(Map<String, dynamic> data) {
    return (data['_attrs'] is Map)
        ? List.from(
            (data['_attrs'] as Map<String, dynamic>).entries.map<Attr>((kvp) => Attr(kvp.key, value: kvp.value)))
        : [];
  }
}
