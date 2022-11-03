// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'no_op_body.dart';
import 'no_op_envelope.dart';

/// A request that does nothing and always returns nothing. Used to keep a session alive,
/// and return any pending notifications.
///
/// If "wait" is set, and if the current session allows them, this request will block until there are new notifications
/// for the client.  Note that the soap envelope must reference an existing session that has notifications enabled, and
/// the notification sequencing number should be specified.
///
/// If "wait" is set, the caller can specify whether notifications on delegate sessions will cause the operation to
/// return.  If "delegate" is unset, delegate mailbox notifications will be ignored.  "delegate" is set by default.
///
/// Some clients (notably browsers) have a global-limit on the number of outstanding sockets...in situations with two
/// App Instances connected to one Zimbra Server, the browser app my appear to 'hang' if two app sessions attempt to do
/// a blocking-NoOp simultaneously.  Since the apps are completely separate in the browser, it is impossible for the
/// apps to coordinate with each other -- therefore the 'limitToOneBlocked' setting is exposed by the server.  If
/// specified, the server will only allow a given user to have one single waiting-NoOp on the server at a time, it will
/// complete (with waitDisallowed set) any existing limited hanging NoOpRequests when a new request comes in.
///
/// The server may reply with a "waitDisallowed" attribute on response to a request with wait set.  If "waitDisallowed"
/// is set, then blocking-NoOpRequests (ie requests with wait set) are <b>not</b> allowed by the server right now, and
/// the client should stop attempting them.
///
/// The client may specify a custom timeout-length for their request if they know something about the particular
/// underlying network.  The server may or may not honor this request (depending on server configured max/min values:
/// see LocalConfig variables zimbra_noop_default_timeout, zimbra_noop_min_timeout and zimbra_noop_max_timeout)
class NoOpRequest extends SoapRequest {
  /// Wait setting
  final bool? wait;

  /// If "wait" is set, the caller can use this setting to determine whether notifications
  /// on delegate sessions will cause the operation to return.
  /// If "delegate" is unset, delegate mailbox notifications will be ignored.
  /// "delegate" is set by default.
  final bool? includeDelegates;

  /// If specified, the server will only allow a given user to have one single
  /// waiting-NoOp on the server at a time, it will complete (with waitDisallowed set) any existing limited hanging
  /// NoOpRequests when a new request comes in.
  final bool? enforceLimit;

  /// The client may specify a custom timeout-length for their request if they know
  /// something about the particular underlying network.
  /// The server may or may not honor this request (depending on server configured max/min values: see LocalConfig
  /// variables zimbra_noop_default_timeout, zimbra_noop_min_timeout and zimbra_noop_max_timeout)
  final int? timeout;

  NoOpRequest({this.wait, this.includeDelegates, this.enforceLimit, this.timeout});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => NoOpEnvelope(NoOpBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (wait != null) 'wait': wait,
        if (includeDelegates != null) 'delegate': includeDelegates,
        if (enforceLimit != null) 'limitToOneBlocked': enforceLimit,
        if (timeout != null) 'timeout': timeout,
      };
}
