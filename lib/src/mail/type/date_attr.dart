// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DateAttr {
  /// Date in format : YYYYMMDDThhmmssZ
  final String date;

  const DateAttr(this.date);

  factory DateAttr.fromMap(Map<String, dynamic> data) => DateAttr(data['d'] ?? '');

  Map<String, dynamic> toMap() => {
        'd': date,
      };
}
