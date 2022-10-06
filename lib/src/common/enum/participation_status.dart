// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ParticipationStatus {
  needsAction,
  accept,
  tentative,
  declined,
  delegated,
  completed,
  inProcess,
  waiting,
  deferred;

  String get name {
    switch (this) {
      case ParticipationStatus.needsAction:
        return 'NE';
      case ParticipationStatus.accept:
        return 'AC';
      case ParticipationStatus.tentative:
        return 'TE';
      case ParticipationStatus.declined:
        return 'DE';
      case ParticipationStatus.delegated:
        return 'DG';
      case ParticipationStatus.completed:
        return 'CO';
      case ParticipationStatus.inProcess:
        return 'IN';
      case ParticipationStatus.waiting:
        return 'WE';
      case ParticipationStatus.deferred:
        return 'DF';
    }
  }
}
