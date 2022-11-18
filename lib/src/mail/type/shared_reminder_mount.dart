// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SharedReminderMount {
  /// Mountpoint ID
  final String id;

  /// Set to enable (or unset to disable) reminders for shared appointments/tasks
  final bool? showReminders;

  const SharedReminderMount(this.id, {this.showReminders});

  factory SharedReminderMount.fromMap(Map<String, dynamic> data) =>
      SharedReminderMount(data['id'] ?? '', showReminders: data['reminder']);

  Map<String, dynamic> toMap() => {
        'id': id,
        if (showReminders != null) 'reminder': showReminders,
      };
}
