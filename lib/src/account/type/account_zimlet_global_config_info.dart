// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_zimlet_property.dart';

class AccountZimletGlobalConfigInfo {
  /// Global zimlet configuration property
  final List<AccountZimletProperty> properties;

  AccountZimletGlobalConfigInfo({this.properties = const []});

  factory AccountZimletGlobalConfigInfo.fromMap(Map<String, dynamic> data) => AccountZimletGlobalConfigInfo(
      properties: (data['property'] is Iterable)
          ? (data['property'] as Iterable)
              .map<AccountZimletProperty>((property) => AccountZimletProperty.fromMap(property))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (properties.isNotEmpty) 'property': properties.map((property) => property.toMap()).toList(growable: false),
      };
}
