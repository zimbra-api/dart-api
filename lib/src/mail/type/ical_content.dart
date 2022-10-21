// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ICalContent {
  /// Item ID
  final String? id;

  /// ICAL
  final String? ical;

  ICalContent({this.id, this.ical});

  factory ICalContent.fromJson(Map<String, dynamic> json) => ICalContent(id: json['id'], ical: json['_content']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (ical != null) '_content': ical,
      };
}
