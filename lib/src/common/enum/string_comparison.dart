// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum StringComparison {
  isA,
  contains,
  matches;

  String get name {
    switch (this) {
      case StringComparison.isA:
        return 'is';
      case StringComparison.contains:
        return 'contains';
      case StringComparison.matches:
        return 'matches';
    }
  }
}
