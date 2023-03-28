// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ICalContent {
  /// Item ID
  final String? id;

  /// ICAL
  final String? ical;

  const ICalContent({this.id, this.ical});

  factory ICalContent.fromMap(Map<String, dynamic> data) => ICalContent(
        id: data['id'],
        ical: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (ical != null) '_content': ical,
      };
}
