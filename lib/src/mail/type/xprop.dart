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

  XProp(this.name, {this.value, this.xParams = const <XParam>[]});

  factory XProp.fromJson(Map<String, dynamic> json) {
    final xprop = XProp(json['name'] ?? '', value: json['_content']);

    if (json['xparam'] != null && json['xparam'] is Iterable) {
      final xParams = json['xparam'] as Iterable;
      for (final xparam in xParams) {
        xprop.xParams.add(XParam.fromJson(xparam));
      }
    }

    return xprop;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        if (value != null) '_content': value,
        if (xParams.isNotEmpty) 'xparam': xParams.map((xparam) => xparam.toJson()),
      };
}
