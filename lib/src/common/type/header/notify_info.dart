// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class NotifyInfo {
  final int? sequenceNum;

  const NotifyInfo({this.sequenceNum});

  factory NotifyInfo.fromMap(Map<String, dynamic> data) =>
      NotifyInfo(sequenceNum: int.tryParse(data['seq']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        if (sequenceNum != null) 'seq': sequenceNum,
      };
}
