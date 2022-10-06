// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ConditionOperator {
  equal,
  has,
  greaterEqual,
  lessEqual,
  greaterThan,
  lessThan,
  startsWith,
  endsWith;

  String get name {
    switch (this) {
      case ConditionOperator.equal:
        return 'eq';
      case ConditionOperator.has:
        return 'has';
      case ConditionOperator.greaterEqual:
        return 'ge';
      case ConditionOperator.lessEqual:
        return 'le';
      case ConditionOperator.greaterThan:
        return 'gt';
      case ConditionOperator.lessThan:
        return 'lt';
      case ConditionOperator.startsWith:
        return 'startswith';
      case ConditionOperator.endsWith:
        return 'endswith';
    }
  }
}
