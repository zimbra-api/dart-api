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

  const FreeBusyUserInfo(
    this.id, {
    this.freeSlots = const [],
    this.busySlots = const [],
    this.tentativeSlots = const [],
    this.unavailableSlots = const [],
    this.nodataSlots = const [],
  });

  factory FreeBusyUserInfo.fromMap(Map<String, dynamic> data) => FreeBusyUserInfo(data['id'] ?? '',
      freeSlots: (data['f'] is Iterable)
          ? (data['f'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)).toList(growable: false)
          : const [],
      busySlots: (data['b'] is Iterable)
          ? (data['b'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)).toList(growable: false)
          : const [],
      tentativeSlots: (data['t'] is Iterable)
          ? (data['t'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)).toList(growable: false)
          : const [],
      unavailableSlots: (data['u'] is Iterable)
          ? (data['u'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)).toList(growable: false)
          : const [],
      nodataSlots: (data['n'] is Iterable)
          ? (data['n'] as Iterable).map<FreeBusySlot>((slot) => FreeBusySlot.fromMap(slot)).toList(growable: false)
          : []);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (freeSlots.isNotEmpty) 'f': freeSlots.map((slot) => slot.toMap()).toList(growable: false),
        if (busySlots.isNotEmpty) 'b': busySlots.map((slot) => slot.toMap()).toList(growable: false),
        if (tentativeSlots.isNotEmpty) 't': tentativeSlots.map((slot) => slot.toMap()).toList(growable: false),
        if (unavailableSlots.isNotEmpty) 'u': unavailableSlots.map((slot) => slot.toMap()).toList(growable: false),
        if (nodataSlots.isNotEmpty) 'n': nodataSlots.map((slot) => slot.toMap()).toList(growable: false),
      };
}
