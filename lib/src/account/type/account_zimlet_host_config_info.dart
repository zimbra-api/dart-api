// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_property.dart';

class AccountZimletHostConfigInfo {
  final String? name;

  final List<AccountZimletProperty> properties;

  AccountZimletHostConfigInfo({this.name, this.properties = const []});

  factory AccountZimletHostConfigInfo.fromJson(Map<String, dynamic> json) {
    final properties = <AccountZimletProperty>[];
    if (json['property'] != null && json['property'] is Iterable) {
      final elements = json['property'] as Iterable;
      for (final property in elements) {
        properties.add(AccountZimletProperty.fromJson(property));
      }
    }

    return AccountZimletHostConfigInfo(name: json['name'], properties: properties);
  }

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (properties.isNotEmpty) 'property': properties.map((property) => property.toJson()).toList(),
      };
}
