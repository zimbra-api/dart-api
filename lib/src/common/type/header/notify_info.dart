// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NotifyInfo {
  final int? sequenceNum;

  NotifyInfo({this.sequenceNum});

  factory NotifyInfo.fromJson(Map<String, dynamic> json) {
    return NotifyInfo(sequenceNum: json['seq']);
  }

  Map<String, dynamic> toJson() => {
        if (sequenceNum != null) 'seq': sequenceNum,
      };
}
