// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum FreeBusyStatus {
  free,
  busy,
  tentative,
  outOfOffice;

  String get name {
    switch (this) {
      case FreeBusyStatus.free:
        return 'F';
      case FreeBusyStatus.busy:
        return 'B';
      case FreeBusyStatus.tentative:
        return 'T';
      case FreeBusyStatus.outOfOffice:
        return 'O';
    }
  }
}
