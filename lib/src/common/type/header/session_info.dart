// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SessionInfo {
  final bool? sessionProxied;

  final String? sessionId;

  final int? sequenceNum;

  final String? value;

  const SessionInfo({
    this.sessionProxied,
    this.sessionId,
    this.sequenceNum,
    this.value,
  });

  factory SessionInfo.fromMap(Map<String, dynamic> data) => SessionInfo(
        sessionProxied: data['proxy'],
        sessionId: data['proxy'],
        sequenceNum: int.tryParse(data['seq']?.toString() ?? ''),
        value: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        if (sessionProxied != null) 'proxy': sessionProxied,
        if (sessionId != null) 'id': sessionId,
        if (sequenceNum != null) 'seq': sequenceNum,
        if (value != null) '_content': value,
      };
}
