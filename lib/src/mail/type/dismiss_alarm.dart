// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DismissAlarm {
  /// Calendar item ID
  final String id;

  /// Time alarm was dismissed, in millis
  final int dismissedAt;

  const DismissAlarm(this.id, this.dismissedAt);

  factory DismissAlarm.fromMap(Map<String, dynamic> data) =>
      DismissAlarm(data['id'] ?? '', int.tryParse(data['dismissedAt']?.toString() ?? '') ?? 0);

  Map<String, dynamic> toMap() => {
        'id': id,
        'dismissedAt': dismissedAt,
      };
}
