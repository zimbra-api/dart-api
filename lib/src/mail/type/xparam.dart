// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Non-standard parameter
class XParam {
  /// XPARAM Name
  final String name;

  /// XPARAM value
  final String? value;

  XParam(this.name, {this.value});

  factory XParam.fromMap(Map<String, dynamic> data) => XParam(data['name'] ?? '', value: data['value']);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (value != null) 'value': value,
      };
}
