// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum MatchType {
  isA,
  contains,
  matches,
  count,
  value;

  String get name {
    switch (this) {
      case MatchType.isA:
        return 'is';
      case MatchType.contains:
        return 'contains';
      case MatchType.matches:
        return 'matches';
      case MatchType.count:
        return 'count';
      case MatchType.value:
        return 'value';
    }
  }
}
