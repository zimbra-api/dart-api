// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// XName Rule
class XNameRule {
  /// XNAME Name
  final String? name;

  /// XNAME value
  final String? value;

  XNameRule({this.name, this.value});

  factory XNameRule.fromJson(Map<String, dynamic> json) => XNameRule(name: json['name'], value: json['value']);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (value != null) 'value': value,
      };
}
