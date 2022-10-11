// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// The raw invitation
class RawInvite {
  final String? uid;

  final String? summary;

  /// Raw iCalendar data
  final String? content;

  RawInvite({this.uid, this.summary, this.content});

  factory RawInvite.fromJson(Map<String, dynamic> json) =>
      RawInvite(uid: json['uid'], summary: json['summary'], content: json['_content']);

  Map<String, dynamic> toJson() => {
        if (uid != null) 'uid': uid,
        if (summary != null) 'summary': summary,
        if (content != null) '_content': content,
      };
}
