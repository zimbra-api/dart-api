// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ExceptIdInfo {
  /// Recurrence ID of exception
  final String recurrenceId;

  /// Invite ID of exception
  final String id;

  ExceptIdInfo(this.recurrenceId, this.id);

  factory ExceptIdInfo.fromJson(Map<String, dynamic> json) => ExceptIdInfo(json['recurId'] ?? '', json['id'] ?? '');

  Map<String, dynamic> toJson() => {
        'recurId': recurrenceId,
        'id': id,
      };
}
