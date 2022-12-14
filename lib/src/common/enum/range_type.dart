// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum RangeType {
  none,
  thisAndFuture,
  thisAndPrior;

  String get name {
    switch (this) {
      case RangeType.none:
        return 'NONE';
      case RangeType.thisAndFuture:
        return 'THISANDFUTURE';
      case RangeType.thisAndPrior:
        return 'THISANDPRIOR';
    }
  }
}
