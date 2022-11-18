// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ExceptIdInfo {
  /// Recurrence ID of exception
  final String recurrenceId;

  /// Invite ID of exception
  final String id;

  const ExceptIdInfo(this.recurrenceId, this.id);

  factory ExceptIdInfo.fromMap(Map<String, dynamic> data) => ExceptIdInfo(data['recurId'] ?? '', data['id'] ?? '');

  Map<String, dynamic> toMap() => {
        'recurId': recurrenceId,
        'id': id,
      };
}
