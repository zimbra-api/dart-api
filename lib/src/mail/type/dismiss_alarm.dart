// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DismissAlarm {
  /// Calendar item ID
  final String id;

  /// Time alarm was dismissed, in millis
  final int dismissedAt;

  DismissAlarm(this.id, this.dismissedAt);
  factory DismissAlarm.fromJson(Map<String, dynamic> json) => DismissAlarm(json['id'] ?? '', json['dismissedAt'] ?? 0);

  Map<String, dynamic> toJson() => {
        'id': id,
        'dismissedAt': dismissedAt,
      };
}
