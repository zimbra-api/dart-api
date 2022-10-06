// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pairs.dart';

import 'account_key_value_pairs.dart';

class AccountCustomMetadata extends AccountKeyValuePairs {
  String? section;

  AccountCustomMetadata({this.section, super.keyValuePairs});

  factory AccountCustomMetadata.fromJson(Map<String, dynamic> json) =>
      AccountCustomMetadata(section: json['section'], keyValuePairs: KeyValuePairs.keyValuePairsFromJson(json));

  @override
  Map<String, dynamic> toJson() => {
        if (section != null) 'section': section,
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toJson()),
      };
}
