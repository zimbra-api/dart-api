// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/conflict_recurrence_instance.dart';

class CheckRecurConflictsResponse extends SoapResponse {
  /// Information on conflicting instances
  final List<ConflictRecurrenceInstance> instances;

  CheckRecurConflictsResponse({this.instances = const []});

  factory CheckRecurConflictsResponse.fromJson(Map<String, dynamic> json) => CheckRecurConflictsResponse(
      instances: (json['inst'] is Iterable)
          ? List.from((json['inst'] as Iterable)
              .map<ConflictRecurrenceInstance>((inst) => ConflictRecurrenceInstance.fromJson(inst)))
          : []);
}
