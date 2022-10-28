// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SnoozeAlarm {
  /// Calendar item ID
  final String id;

  /// When to show the alarm again in milliseconds since the epoch
  final int snoozeUntil;

  SnoozeAlarm(this.id, this.snoozeUntil);

  factory SnoozeAlarm.fromJson(Map<String, dynamic> json) => SnoozeAlarm(json['id'] ?? '', json['until'] ?? 0);

  Map<String, dynamic> toJson() => {
        'id': id,
        'until': snoozeUntil,
      };
}