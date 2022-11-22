// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/expanded_recurrence_instance.dart';

class ExpandRecurResponse extends SoapResponse {
  /// Expanded recurrence instances
  final List<ExpandedRecurrenceInstance> instances;

  ExpandRecurResponse({this.instances = const []});

  factory ExpandRecurResponse.fromMap(Map<String, dynamic> data) => ExpandRecurResponse(
      instances: (data['inst'] is Iterable)
          ? (data['inst'] as Iterable)
              .map<ExpandedRecurrenceInstance>((inst) => ExpandedRecurrenceInstance.fromMap(inst))
              .toList(growable: false)
          : const []);
}
