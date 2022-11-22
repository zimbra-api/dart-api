// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../type/filter_rule.dart';
import 'get_filter_rules_response.dart';

class GetOutgoingFilterRulesResponse extends GetFilterRulesResponse {
  GetOutgoingFilterRulesResponse({super.filterRules = const []});

  factory GetOutgoingFilterRulesResponse.fromMap(Map<String, dynamic> data) => GetOutgoingFilterRulesResponse(
      filterRules: (data['filterRules']?[0]?['filterRule'] is Iterable)
          ? (data['filterRules'][0]['filterRule'] as Iterable)
              .map<FilterRule>((filterRule) => FilterRule.fromMap(filterRule))
              .toList(growable: false)
          : const []);
}
