// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum VerbType {
  accept,
  decline,
  tentative,
  completed,
  delegated;

  String get name {
    switch (this) {
      case VerbType.accept:
        return 'ACCEPT';
      case VerbType.decline:
        return 'DECLINE';
      case VerbType.tentative:
        return 'TENTATIVE';
      case VerbType.completed:
        return 'COMPLETED';
      case VerbType.delegated:
        return 'DELEGATED';
    }
  }
}
