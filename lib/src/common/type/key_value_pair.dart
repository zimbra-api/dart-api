// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class KeyValuePair {
  final String key;

  final String? value;

  KeyValuePair(this.key, {this.value});

  factory KeyValuePair.fromJson(Map<String, dynamic> json) => KeyValuePair(json['n'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        'n': key,
        if (value != null) '_content': value,
      };
}
