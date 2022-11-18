// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/view_type.dart';

/// Input for creating a new mountpoint
class NewMountpointSpec {
  /// Mountpoint name
  final String name;

  /// (optional) Default type for the folder; used by web client to decide which view to use;
  /// possible values are the same as SearchRequest's {types}: conversation|message|contact|etc
  final ViewType? defaultView;

  /// Flags
  final String? flags;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// URL (RSS, iCal, etc.) this folder syncs its contents to
  final String? url;

  /// Parent folder ID
  final String? folderId;

  /// If set, the server will fetch the folder if it already exists rather than throwing mail.ALREADY_EXISTS
  final bool? fetchIfExists;

  /// If set, client should display reminders for shared appointments/tasks
  final bool? reminderEnabled;

  /// Zimbra ID (guid) of the owner of the linked-to resource
  final String? ownerId;

  /// Primary email address of the owner of the linked-to resource
  final String? ownerName;

  /// Item ID of the linked-to resource in the remote mailbox
  final int? remoteId;

  /// Path to shared item
  final String? path;

  const NewMountpointSpec(
    this.name, {
    this.defaultView,
    this.flags,
    this.color,
    this.rgb,
    this.url,
    this.folderId,
    this.fetchIfExists,
    this.reminderEnabled,
    this.ownerId,
    this.ownerName,
    this.remoteId,
    this.path,
  });

  factory NewMountpointSpec.fromMap(Map<String, dynamic> data) => NewMountpointSpec(data['name'] ?? '',
      defaultView: ViewType.values.firstWhere(
        (view) => view.name == data['view'],
        orElse: () => ViewType.conversation,
      ),
      flags: data['f'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      rgb: data['rgb'],
      url: data['url'],
      folderId: data['l'],
      fetchIfExists: data['fie'],
      reminderEnabled: data['reminder'],
      ownerId: data['zid'],
      ownerName: data['owner'],
      remoteId: int.tryParse(data['rid']?.toString() ?? ''),
      path: data['path']);

  Map<String, dynamic> toMap() => {
        'name': name,
        if (defaultView != null) 'view': defaultView!.name,
        if (flags != null) 'f': flags,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (url != null) 'url': url,
        if (folderId != null) 'l': folderId,
        if (fetchIfExists != null) 'fie': fetchIfExists,
        if (reminderEnabled != null) 'reminder': reminderEnabled,
        if (ownerId != null) 'zid': ownerId,
        if (ownerName != null) 'owner': ownerName,
        if (remoteId != null) 'rid': remoteId,
        if (path != null) 'path': path,
      };
}
