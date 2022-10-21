// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'free_busy_slot.dart';

class FreeBusyUserInfo {
  /// Account identifier (email or id) "id" is always account email;
  /// it is not zimbraId as the attribute name may suggest
  final String id;

  /// Free slots
  final List<FreeBusySlot> freeSlots;

  /// Busy slots
  final List<FreeBusySlot> busySlots;

  /// Tentative slots
  final List<FreeBusySlot> tentativeSlots;

  /// Unavailable slots;
  final List<FreeBusySlot> unavailableSlots;

  /// No data slots
  final List<FreeBusySlot> nodataSlots;

  FreeBusyUserInfo(this.id,
      {this.freeSlots = const [],
      this.busySlots = const [],
      this.tentativeSlots = const [],
      this.unavailableSlots = const [],
      this.nodataSlots = const []});

  factory FreeBusyUserInfo.fromJson(Map<String, dynamic> json) => FreeBusyUserInfo(json['id'] ?? '',
      freeSlots: (json['f'] is Iterable)
          ? List.from((json['f'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromJson(slot)))
          : [],
      busySlots: (json['b'] is Iterable)
          ? List.from((json['b'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromJson(slot)))
          : [],
      tentativeSlots: (json['t'] is Iterable)
          ? List.from((json['t'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromJson(slot)))
          : [],
      unavailableSlots: (json['u'] is Iterable)
          ? List.from((json['u'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromJson(slot)))
          : [],
      nodataSlots: (json['n'] is Iterable)
          ? List.from((json['n'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromJson(slot)))
          : []);

  Map<String, dynamic> toJson() => {
        'id': id,
        if (freeSlots.isNotEmpty) 'f': freeSlots.map((slot) => slot.toJson()).toList(),
        if (busySlots.isNotEmpty) 'b': busySlots.map((slot) => slot.toJson()).toList(),
        if (tentativeSlots.isNotEmpty) 't': tentativeSlots.map((slot) => slot.toJson()).toList(),
        if (unavailableSlots.isNotEmpty) 'u': unavailableSlots.map((slot) => slot.toJson()).toList(),
        if (nodataSlots.isNotEmpty) 'n': nodataSlots.map((slot) => slot.toJson()).toList(),
      };
}
