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

  Invitation(
      {this.calItemType,
      this.sequence,
      this.id,
      this.componentNum,
      this.recurrenceId,
      this.timezones = const [],
      this.inviteComponent,
      this.partInfos = const [],
      this.shareNotifications = const [],
      this.dlSubsNotifications = const []});

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
      calItemType: InviteType.values.firstWhere(
        (type) => type.name == json['type'],
        orElse: () => InviteType.appt,
      ),
      sequence: json['seq'],
      id: json['id'],
      componentNum: json['compNum'],
      recurrenceId: json['recurId'],
      timezones: (json['tz'] is Iterable)
          ? List.from((json['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromJson(tz)))
          : [],
      inviteComponent: (json['comp'] is Map) ? InviteComponent.fromJson(json['comp']) : null,
      partInfos: (json['mp'] is Iterable)
          ? List.from((json['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromJson(mp)))
          : [],
      shareNotifications: (json['shr'] is Iterable)
          ? List.from((json['shr'] as Iterable).map<ShareNotification>((shr) => ShareNotification.fromJson(shr)))
          : [],
      dlSubsNotifications: (json['dlSubs'] is Iterable)
          ? List.from((json['dlSubs'] as Iterable)
              .map<DLSubscriptionNotification>((dlSubs) => DLSubscriptionNotification.fromJson(dlSubs)))
          : []);

  Map<String, dynamic> toJson() => {
        if (calItemType != null) 'type': calItemType!.name,
        if (sequence != null) 'seq': sequence,
        if (id != null) 'id': id,
        if (componentNum != null) 'compNum': componentNum,
        if (recurrenceId != null) 'recurId': recurrenceId,
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (inviteComponent != null) 'comp': inviteComponent!.toJson(),
        if (partInfos.isNotEmpty) 'mp': partInfos.map((mp) => mp.toJson()).toList(),
        if (shareNotifications.isNotEmpty) 'shr': shareNotifications.map((shr) => shr.toJson()).toList(),
        if (dlSubsNotifications.isNotEmpty) 'dlSubs': dlSubsNotifications.map((dlSubs) => dlSubs.toJson()).toList(),
      };
}
