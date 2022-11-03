// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'sync_body.dart';
import 'sync_envelope.dart';

/// Sync on other mailbox is done via specifying target account in SOAP header
/// If we're delta syncing on another user's mailbox and any folders have changed:
/// - If there are now no visible folders, you'll get an empty <folder> element
/// - If there are any visible folders, you'll get the full visible folder hierarchy
/// If a {root-folder-id} other than the mailbox root (folder 1) is requested or if not all folders are visible
/// when syncing to another user's mailbox, all changed items in other folders are presented as deletes
/// If the response is a mail.MUST_RESYNC fault, client has fallen too far out of date and must re-initial sync
class SyncRequest extends SoapRequest {
  /// Token - not provided for initial sync
  final String? token;

  /// Calendar date.
  /// If present, omit all appointments and tasks that don't have a recurrence ending after that time (specified in ms)
  final int? calendarCutoff;

  /// Earliest Message date.
  /// If present, omit all Messages and conversations that are older than time (specified in seconds)
  /// "Note:value in seconds, unlike calCutoff which is in milliseconds"
  final int? msgCutoff;

  /// Root folder ID.
  /// If present, we start sync there rather than at folder 11
  final String? folderId;

  /// If specified and set, deletes are also broken down by item type
  final bool? typedDeletes;

  /// maximum number of deleted item ids returned in a response.
  final int? deleteLimit;

  /// maximum number of modified item ids returned in a response.
  final int? changeLimit;

  SyncRequest(
      {this.token,
      this.calendarCutoff,
      this.msgCutoff,
      this.folderId,
      this.typedDeletes,
      this.deleteLimit,
      this.changeLimit});
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SyncEnvelope(SyncBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (token != null) 'token': token,
        if (calendarCutoff != null) 'calCutoff': calendarCutoff,
        if (msgCutoff != null) 'msgCutoff': msgCutoff,
        if (folderId != null) 'l': folderId,
        if (typedDeletes != null) 'typed': typedDeletes,
        if (deleteLimit != null) 'deleteLimit': deleteLimit,
        if (changeLimit != null) 'changeLimit': changeLimit,
      };
}
