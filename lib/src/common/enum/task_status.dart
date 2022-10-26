// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum TaskStatus {
  need,
  inpr,
  waiting,
  deferred,
  comp;

  String get name {
    switch (this) {
      case TaskStatus.need:
        return 'NEED';
      case TaskStatus.inpr:
        return 'INPR';
      case TaskStatus.waiting:
        return 'WAITING';
      case TaskStatus.deferred:
        return 'DEFERRED';
      case TaskStatus.comp:
        return 'COMP';
    }
  }
}
