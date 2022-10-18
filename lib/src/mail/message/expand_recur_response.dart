// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/expanded_recurrence_instance.dart';

class ExpandRecurResponse extends SoapResponse {
  /// Expanded recurrence instances
  final List<ExpandedRecurrenceInstance> instances;

  ExpandRecurResponse({this.instances = const []});

  factory ExpandRecurResponse.fromJson(Map<String, dynamic> json) => ExpandRecurResponse(
      instances: (json['inst'] is Iterable)
          ? List.from((json['inst'] as Iterable)
              .map<ExpandedRecurrenceInstance>((inst) => ExpandedRecurrenceInstance.fromJson(inst)))
          : []);
}
