// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_property.dart';

class AccountZimletHostConfigInfo {
  final String? name;

  final List<AccountZimletProperty> properties;

  const AccountZimletHostConfigInfo({this.name, this.properties = const []});

  factory AccountZimletHostConfigInfo.fromMap(Map<String, dynamic> data) => AccountZimletHostConfigInfo(
        name: data['name'],
        properties: (data['property'] is Iterable)
            ? (data['property'] as Iterable)
                .map<AccountZimletProperty>((property) => AccountZimletProperty.fromMap(property))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (properties.isNotEmpty) 'property': properties.map((property) => property.toMap()).toList(growable: false),
      };
}
