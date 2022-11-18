// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The raw invitation
class RawInvite {
  final String? uid;

  final String? summary;

  /// Raw iCalendar data
  final String? content;

  const RawInvite({this.uid, this.summary, this.content});

  factory RawInvite.fromMap(Map<String, dynamic> data) =>
      RawInvite(uid: data['uid'], summary: data['summary'], content: data['_content']);

  Map<String, dynamic> toMap() => {
        if (uid != null) 'uid': uid,
        if (summary != null) 'summary': summary,
        if (content != null) '_content': content,
      };
}
