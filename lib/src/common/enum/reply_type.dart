// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ReplyType {
  replied,
  forwarded;

  String get name {
    switch (this) {
      case ReplyType.replied:
        return 'r';
      case ReplyType.forwarded:
        return 'w';
    }
  }
}
