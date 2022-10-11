// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum WeekDay {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday;

  String get name {
    switch (this) {
      case WeekDay.sunday:
        return 'SU';
      case WeekDay.monday:
        return 'MO';
      case WeekDay.tuesday:
        return 'TU';
      case WeekDay.wednesday:
        return 'WE';
      case WeekDay.thursday:
        return 'TH';
      case WeekDay.friday:
        return 'FR';
      case WeekDay.saturday:
        return 'SA';
    }
  }
}
