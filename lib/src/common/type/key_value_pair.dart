// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class KeyValuePair {
  final String key;

  final String? value;

  const KeyValuePair(this.key, {this.value});

  factory KeyValuePair.fromMap(Map<String, dynamic> data) => KeyValuePair(data['n'], value: data['_content']);

  Map<String, dynamic> toMap() => {
        'n': key,
        if (value != null) '_content': value,
      };
}
