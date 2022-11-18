// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pairs.dart';

class MailKeyValuePairs extends KeyValuePairs {
  const MailKeyValuePairs({super.keyValuePairs});

  factory MailKeyValuePairs.fromMap(Map<String, dynamic> data) =>
      MailKeyValuePairs(keyValuePairs: KeyValuePairs.keyValuePairsFromMap(data));
}
