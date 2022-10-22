// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/filter_rule.dart';

import 'get_filter_rules_response.dart';

class GetOutgoingFilterRulesResponse extends GetFilterRulesResponse {
  GetOutgoingFilterRulesResponse({super.filterRules = const []});

  factory GetOutgoingFilterRulesResponse.fromJson(Map<String, dynamic> json) => GetOutgoingFilterRulesResponse(
      filterRules: (json['filterRules']?['filterRule'] is Iterable)
          ? List.from((json['filterRules']['filterRule'] as Iterable)
              .map<FilterRule>((filterRule) => FilterRule.fromJson(filterRule)))
          : []);
}