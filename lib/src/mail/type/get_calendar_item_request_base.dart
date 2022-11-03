// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_request.dart';

abstract class GetCalendarItemRequestBase extends SoapRequest {
  /// iCalendar UID
  /// Either id or uid should be specified, but not both
  final String? uid;

  /// Appointment ID.
  /// Either id or uid should be specified, but not both
  final String? id;

  /// Set this to return the modified date (md) on the appointment.
  final bool? sync;

  /// If set, MIME parts for body content are returned; default unset
  final bool? includeContent;

  /// If set, information for each invite is included; default set
  final bool? includeInvites;

  GetCalendarItemRequestBase({this.uid, this.id, this.sync, this.includeContent, this.includeInvites});

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (uid != null) 'uid': uid,
        if (id != null) 'id': id,
        if (sync != null) 'sync': sync,
        if (includeContent != null) 'includeContent': includeContent,
        if (includeInvites != null) 'includeInvites': includeInvites,
      };
}
