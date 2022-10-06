// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ChangeInfo {
  final String? changeId;

  final String? changeType;

  ChangeInfo({this.changeId, this.changeType});

  factory ChangeInfo.fromJson(Map<String, dynamic> json) {
    return ChangeInfo(changeId: json['token'], changeType: json['token']);
  }

  Map<String, dynamic> toJson() => {
        if (changeId != null) 'token': changeId,
        if (changeType != null) 'type': changeType,
      };
}
