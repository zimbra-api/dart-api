// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Date time string attribute
class DateTimeStringAttr {
  /// Date in format : YYYYMMDD[ThhmmssZ]
  final String dateTime;

  const DateTimeStringAttr(this.dateTime);

  factory DateTimeStringAttr.fromMap(Map<String, dynamic> data) => DateTimeStringAttr(data['d'] ?? '');

  Map<String, dynamic> toMap() => {
        'd': dateTime,
      };
}
