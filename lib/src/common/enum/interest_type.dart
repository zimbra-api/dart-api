// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum InterestType {
  folders,
  messages,
  contacts,
  appointments,
  tasks,
  documents,
  all;

  String get name {
    switch (this) {
      case InterestType.folders:
        return 'f';
      case InterestType.messages:
        return 'm';
      case InterestType.contacts:
        return 'c';
      case InterestType.appointments:
        return 'a';
      case InterestType.tasks:
        return 't';
      case InterestType.documents:
        return 'd';
      case InterestType.all:
        return 'all';
    }
  }
}
