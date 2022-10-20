// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum CountComparison {
  greaterThan,
  greaterEqual,
  lessThan,
  lessEqual,
  equal,
  notEqual;

  String get name {
    switch (this) {
      case CountComparison.greaterThan:
        return 'gt';
      case CountComparison.greaterEqual:
        return 'ge';
      case CountComparison.lessThan:
        return 'lt';
      case CountComparison.lessEqual:
        return 'le';
      case CountComparison.equal:
        return 'eq';
      case CountComparison.notEqual:
        return 'ne';
    }
  }
}
