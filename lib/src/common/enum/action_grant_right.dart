// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ActionGrantRight {
  read,
  write,
  insert,
  delete,
  administer,
  workflowAction,
  viewPrivate,
  viewFreebusy,
  createSubfolder;

  String get name {
    switch (this) {
      case ActionGrantRight.read:
        return 'r';
      case ActionGrantRight.write:
        return 'w';
      case ActionGrantRight.insert:
        return 'i';
      case ActionGrantRight.delete:
        return 'd';
      case ActionGrantRight.administer:
        return 'a';
      case ActionGrantRight.workflowAction:
        return 'x';
      case ActionGrantRight.viewPrivate:
        return 'p';
      case ActionGrantRight.viewFreebusy:
        return 'f';
      case ActionGrantRight.createSubfolder:
        return 'c';
    }
  }
}
