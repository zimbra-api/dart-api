// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pairs.dart';

import 'account_key_value_pairs.dart';

class CalendarResourceInfo extends AccountKeyValuePairs {
  /// Name of calendar resource
  final String name;

  /// ID of calendar resource
  final String id;

  CalendarResourceInfo(this.name, this.id, {super.keyValuePairs});

  factory CalendarResourceInfo.fromMap(Map<String, dynamic> data) =>
      CalendarResourceInfo(data['name'] ?? '', data['id'] ?? '',
          keyValuePairs: KeyValuePairs.keyValuePairsFromJson(data));

  @override
  Map<String, dynamic> toMap() => {
        'name': name,
        'id': id,
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toMap()),
      };
}
