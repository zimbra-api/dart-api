// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ChangeInfo {
  final int? changeId;

  final String? changeType;

  const ChangeInfo({this.changeId, this.changeType});

  factory ChangeInfo.fromMap(Map<String, dynamic> data) =>
      ChangeInfo(changeId: int.tryParse(data['token']?.toString() ?? ''), changeType: data['type']);

  Map<String, dynamic> toMap() => {
        if (changeId != null) 'token': changeId,
        if (changeType != null) 'type': changeType,
      };
}
