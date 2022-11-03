// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/common/type/wait_set_add_spec.dart';

import 'wait_set_body.dart';
import 'wait_set_envelope.dart';

/// WaitSetRequest optionally modifies the wait set and checks for any notifications.
/// If <block> is set and there are no notifications, then this API will BLOCK until there is data.
///
/// Client should always set 'seq' to be the highest known value it has received from the server.  The server will use
/// this information to retransmit lost data.
///
/// If the client sends a last known sync token then the notification is calculated by comparing the accounts current
/// token with the client's last known.
///
/// If the client does not send a last known sync token, then notification is based on change since last Wait
/// (or change since &lt;add> if this is the first time Wait has been called with the account)
///
/// The client may specify a custom timeout-length for their request if they know something about the particular
/// underlying network.  The server may or may not honor this request (depending on server configured max/min values).
/// See LocalConfig values:
/// - zimbra_waitset_default_request_timeout,
/// - zimbra_waitset_min_request_timeout,
/// - zimbra_waitset_max_request_timeout,
/// - zimbra_admin_waitset_default_request_timeout,
/// - zimbra_admin_waitset_min_request_timeout, and
/// - zimbra_admin_waitset_max_request_timeout
/// WaitSet: scalable mechanism for listening for changes to one or more accounts
class WaitSetRequest extends SoapRequest {
  /// Waitset ID
  final String waitSetId;

  /// Last known lastKnownSeqNo number
  final String? lastKnownSeqNo;

  /// Flag whether or not to block until some account has new data
  final bool? block;

  /// Default interest types: comma-separated list.  Currently:
  /// f: folders
  /// m: messages
  /// c: contacts
  /// a: appointments
  /// t: tasks
  /// d: documents
  /// all: all types (equiv to "f,m,c,a,t,d")
  final String? defaultInterests;

  /// Timeout length
  final int? timeout;

  /// bool flag. If true, WaitSetResponse will include details of Pending Modifications.
  final bool? expand;

  /// Waitsets to add
  final List<WaitSetAddSpec> addAccounts;

  final List<WaitSetAddSpec> updateAccounts;

  /// Waitsets to remove
  final List<Id> removeAccounts;

  WaitSetRequest(this.waitSetId,
      {this.lastKnownSeqNo,
      this.block,
      this.defaultInterests,
      this.timeout,
      this.expand,
      this.addAccounts = const [],
      this.updateAccounts = const [],
      this.removeAccounts = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => WaitSetEnvelope(WaitSetBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'waitSet': waitSetId,
        if (block != null) 'block': block,
        if (defaultInterests != null) 'defTypes': defaultInterests,
        if (timeout != null) 'timeout': timeout,
        if (expand != null) 'expand': expand,
        if (addAccounts.isNotEmpty) 'add': {'a': addAccounts.map((a) => a.toMap()).toList()},
        if (updateAccounts.isNotEmpty) 'update': {'a': updateAccounts.map((a) => a.toMap()).toList()},
        if (removeAccounts.isNotEmpty) 'remove': {'a': removeAccounts.map((a) => a.toMap()).toList()},
      };
}
