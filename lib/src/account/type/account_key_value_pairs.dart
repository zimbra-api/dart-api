// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pairs.dart';

class AccountKeyValuePairs extends KeyValuePairs {
  AccountKeyValuePairs({super.keyValuePairs});

  factory AccountKeyValuePairs.fromJson(Map<String, dynamic> json) =>
      AccountKeyValuePairs(keyValuePairs: KeyValuePairs.keyValuePairsFromJson(json));
}
