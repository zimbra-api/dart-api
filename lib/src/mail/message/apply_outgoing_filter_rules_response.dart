// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/ids_attr.dart';

import 'apply_filter_rules_response.dart';

class ApplyOutgoingFilterRulesResponse extends ApplyFilterRulesResponse {
  ApplyOutgoingFilterRulesResponse({super.msgIds});

  factory ApplyOutgoingFilterRulesResponse.fromJson(Map<String, dynamic> json) =>
      ApplyOutgoingFilterRulesResponse(msgIds: (json['m'] is Map) ? IdsAttr.fromJson(json['m']) : null);
}
