// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/invite_type.dart';

import 'cal_tz_info.dart';
import 'dl_subscription_notification.dart';
import 'invite_component.dart';
import 'part_info.dart';
import 'share_notification.dart';

class Invitation {
  /// Calendar item type - appt|task
  final InviteType? calItemType;

  /// Sequence number
  final int? sequence;

  /// Original mail item ID for invite
  final String? id;

  /// Component number
  final int? componentNum;

  /// Recurrence ID in format : YYMMDD[THHMMSS[Z]]
  final String? recurrenceId;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// Invite component
  final InviteComponent? inviteComponent;

  /// Mime parts
  final List<PartInfo> partInfos;

  /// Share notifications
  final List<ShareNotification> shareNotifications;

  /// Distribution list subscription notifications
  final List<DLSubscriptionNotification> dlSubsNotifications;

  const Invitation({
    this.calItemType,
    this.sequence,
    this.id,
    this.componentNum,
    this.recurrenceId,
    this.timezones = const [],
    this.inviteComponent,
    this.partInfos = const [],
    this.shareNotifications = const [],
    this.dlSubsNotifications = const [],
  });

  factory Invitation.fromMap(Map<String, dynamic> data) => Invitation(
      calItemType: InviteType.values.firstWhere(
        (type) => type.name == data['type'],
        orElse: () => InviteType.appt,
      ),
      sequence: int.tryParse(data['seq']?.toString() ?? ''),
      id: data['id'],
      componentNum: int.tryParse(data['compNum']?.toString() ?? ''),
      recurrenceId: data['recurId'],
      timezones: (data['tz'] is Iterable)
          ? (data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)).toList(growable: false)
          : const [],
      inviteComponent: (data['comp'] is Map) ? InviteComponent.fromMap(data['comp']) : null,
      partInfos: (data['mp'] is Iterable)
          ? (data['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromMap(mp)).toList(growable: false)
          : const [],
      shareNotifications: (data['shr'] is Iterable)
          ? (data['shr'] as Iterable)
              .map<ShareNotification>((shr) => ShareNotification.fromMap(shr))
              .toList(growable: false)
          : const [],
      dlSubsNotifications: (data['dlSubs'] is Iterable)
          ? (data['dlSubs'] as Iterable)
              .map<DLSubscriptionNotification>((dlSubs) => DLSubscriptionNotification.fromMap(dlSubs))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (calItemType != null) 'type': calItemType!.name,
        if (sequence != null) 'seq': sequence,
        if (id != null) 'id': id,
        if (componentNum != null) 'compNum': componentNum,
        if (recurrenceId != null) 'recurId': recurrenceId,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(growable: false),
        if (inviteComponent != null) 'comp': inviteComponent!.toMap(),
        if (partInfos.isNotEmpty) 'mp': partInfos.map((mp) => mp.toMap()).toList(growable: false),
        if (shareNotifications.isNotEmpty) 'shr': shareNotifications.map((shr) => shr.toMap()).toList(growable: false),
        if (dlSubsNotifications.isNotEmpty)
          'dlSubs': dlSubsNotifications.map((dlSubs) => dlSubs.toMap()).toList(growable: false),
      };
}
