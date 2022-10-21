// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/free_busy_user_spec.dart';

import 'get_free_busy_body.dart';
import 'get_free_busy_envelope.dart';

/// Get Free/Busy information.
/// For freebusyUsers listed using uid,id or name attributes, f/b search will be done for all calendar folders.
/// To view free/busy for a single folder in a particular account, use <usr>
class GetFreeBusyRequest extends SoapRequest {
  /// Range start in milliseconds
  final int startTime;

  /// Range end in milliseconds
  final int endTime;

  /// DEPRECATED. Comma-separated list of Zimbra IDs or emails.
  /// Each value can be a Ziimbra ID or an email.
  final String? uid;

  /// Comma separated list of Zimbra IDs
  final String? id;

  /// Comma separated list of emails
  final String? name;

  /// UID of appointment to exclude from free/busy search
  final String? excludeUid;

  /// To view free/busy for a single folders in particular accounts, use these.
  final List<FreeBusyUserSpec> freebusyUsers;

  GetFreeBusyRequest(this.startTime, this.endTime,
      {this.uid, this.id, this.name, this.excludeUid, this.freebusyUsers = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetFreeBusyEnvelope(GetFreeBusyBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        's': startTime,
        'e': endTime,
        if (uid != null) 'uid': uid,
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (excludeUid != null) 'excludeUid': excludeUid,
        if (freebusyUsers.isNotEmpty) 'usr': freebusyUsers.map((usr) => usr.toJson()).toList(),
      };
}
