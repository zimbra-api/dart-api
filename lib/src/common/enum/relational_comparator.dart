// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum RelationalComparator {
  greaterThan,
  greaterEqual,
  lessThan,
  lessEqual,
  equal,
  notEqual;

  String get name {
    switch (this) {
      case RelationalComparator.greaterThan:
        return 'gt';
      case RelationalComparator.greaterEqual:
        return 'ge';
      case RelationalComparator.lessThan:
        return 'lt';
      case RelationalComparator.lessEqual:
        return 'le';
      case RelationalComparator.equal:
        return 'eq';
      case RelationalComparator.notEqual:
        return 'ne';
    }
  }
}
