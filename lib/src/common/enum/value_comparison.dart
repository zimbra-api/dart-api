// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ValueComparison {
  greaterThan,
  greaterEqual,
  lessThan,
  lessEqual,
  equal,
  notEqual;

  String get name {
    switch (this) {
      case ValueComparison.greaterThan:
        return 'gt';
      case ValueComparison.greaterEqual:
        return 'ge';
      case ValueComparison.lessThan:
        return 'lt';
      case ValueComparison.lessEqual:
        return 'le';
      case ValueComparison.equal:
        return 'eq';
      case ValueComparison.notEqual:
        return 'ne';
    }
  }
}