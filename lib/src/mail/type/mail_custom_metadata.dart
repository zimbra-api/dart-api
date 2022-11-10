// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pairs.dart';

import 'mail_key_value_pairs.dart';

class MailCustomMetadata extends MailKeyValuePairs {
  /// Section
  /// Normally present.
  /// If absent this indicates that CustomMetadata info is present but there are no sections to report on.
  final String? section;

  MailCustomMetadata({this.section, super.keyValuePairs});

  factory MailCustomMetadata.fromMap(Map<String, dynamic> data) =>
      MailCustomMetadata(section: data['section'], keyValuePairs: KeyValuePairs.keyValuePairsFromMap(data));

  @override
  Map<String, dynamic> toMap() => {
        if (section != null) 'section': section,
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((kvp) => kvp.toMap()).toList(growable: false),
      };
}
