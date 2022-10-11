// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum Frequency {
  second,
  minute,
  hour,
  daily,
  weekly,
  monthly,
  yearly;

  String get name {
    switch (this) {
      case Frequency.second:
        return 'SEC';
      case Frequency.minute:
        return 'MIN';
      case Frequency.hour:
        return 'HOU';
      case Frequency.daily:
        return 'DAI';
      case Frequency.weekly:
        return 'WEE';
      case Frequency.monthly:
        return 'MON';
      case Frequency.yearly:
        return 'YEA';
    }
  }
}
