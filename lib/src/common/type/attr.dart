// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'key_value_pair.dart';

class Attr extends KeyValuePair {
  Attr(super.key, {super.value});

  factory Attr.fromMap(Map<String, dynamic> data) => Attr(data['n'], value: data['_content']);
}
