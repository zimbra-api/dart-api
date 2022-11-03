// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/filter_rule.dart';

class GetFilterRulesResponse extends SoapResponse {
  /// Filter rules
  final List<FilterRule> filterRules;

  GetFilterRulesResponse({this.filterRules = const []});

  factory GetFilterRulesResponse.fromMap(Map<String, dynamic> data) => GetFilterRulesResponse(
      filterRules: (data['filterRules']?[0]['filterRule'] is Iterable)
          ? List.from((data['filterRules'][0]['filterRule'] as Iterable)
              .map<FilterRule>((filterRule) => FilterRule.fromMap(filterRule)))
          : []);
}
