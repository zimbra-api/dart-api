// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FilterVariable {
  ///Rule name
  final String? name;

  /// Value
  final String? value;

  const FilterVariable({this.name, this.value});

  factory FilterVariable.fromMap(Map<String, dynamic> data) =>
      FilterVariable(name: data['name'], value: data['value']);

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (value != null) 'value': value,
      };
}
