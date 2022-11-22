// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/key_value_pairs.dart';
import 'account_key_value_pairs.dart';

class AccountCustomMetadata extends AccountKeyValuePairs {
  final String? section;

  const AccountCustomMetadata({this.section, super.keyValuePairs});

  factory AccountCustomMetadata.fromMap(Map<String, dynamic> data) =>
      AccountCustomMetadata(section: data['section'], keyValuePairs: KeyValuePairs.keyValuePairsFromMap(data));

  @override
  Map<String, dynamic> toMap() => {
        if (section != null) 'section': section,
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toMap()).toList(growable: false),
      };
}
