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

  factory FreeBusyUserInfo.fromMap(Map<String, dynamic> data) => FreeBusyUserInfo(data['id'] ?? '',
      freeSlots: (data['f'] is Iterable)
          ? List.from((data['f'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)))
          : [],
      busySlots: (data['b'] is Iterable)
          ? List.from((data['b'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)))
          : [],
      tentativeSlots: (data['t'] is Iterable)
          ? List.from((data['t'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)))
          : [],
      unavailableSlots: (data['u'] is Iterable)
          ? List.from((data['u'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)))
          : [],
      nodataSlots: (data['n'] is Iterable)
          ? List.from((data['n'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)))
          : []);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (freeSlots.isNotEmpty) 'f': freeSlots.map((slot) => slot.toMap()).toList(),
        if (busySlots.isNotEmpty) 'b': busySlots.map((slot) => slot.toMap()).toList(),
        if (tentativeSlots.isNotEmpty) 't': tentativeSlots.map((slot) => slot.toMap()).toList(),
        if (unavailableSlots.isNotEmpty) 'u': unavailableSlots.map((slot) => slot.toMap()).toList(),
        if (nodataSlots.isNotEmpty) 'n': nodataSlots.map((slot) => slot.toMap()).toList(),
      };
}
