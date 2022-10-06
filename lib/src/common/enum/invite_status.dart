// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum InviteStatus {
  tentative,
  confirmed,
  cancelled,
  completed,
  inprogress,
  waiting,
  deferred;

  String get name {
    switch (this) {
      case InviteStatus.tentative:
        return 'TENT';
      case InviteStatus.confirmed:
        return 'CONF';
      case InviteStatus.cancelled:
        return 'CANC';
      case InviteStatus.completed:
        return 'COMP';
      case InviteStatus.inprogress:
        return 'INPR';
      case InviteStatus.waiting:
        return 'WAITING';
      case InviteStatus.deferred:
        return 'DEFERRED';
    }
  }
}
