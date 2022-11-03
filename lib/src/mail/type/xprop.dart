// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'xparam.dart';

/// Non-standard parameter
class XProp {
  /// XPROP Name
  final String name;

  /// XPROP value
  final String? value;

  final List<XParam> xParams;

  XProp(this.name, {this.value, this.xParams = const []});

  factory XProp.fromMap(Map<String, dynamic> data) => XProp(data['name'] ?? '',
      value: data['_content'],
      xParams: (data['xparam'] is Iterable)
          ? List.from((data['xparam'] as Iterable).map<XParam>((xparam) => XParam.fromMap(xparam)))
          : []);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (value != null) '_content': value,
        if (xParams.isNotEmpty) 'xparam': xParams.map((xparam) => xparam.toMap()).toList(),
      };
}
