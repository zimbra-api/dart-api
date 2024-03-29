// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/key_value_pairs.dart';

class AccountKeyValuePairs extends KeyValuePairs {
  const AccountKeyValuePairs({super.keyValuePairs});

  factory AccountKeyValuePairs.fromMap(
    Map<String, dynamic> data,
  ) =>
      AccountKeyValuePairs(
        keyValuePairs: KeyValuePairs.keyValuePairsFromMap(data),
      );
}
