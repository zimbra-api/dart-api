// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum AddressType {
  from,
  to,
  cc,
  bcc,
  replyTo,
  sender,
  notification,
  resentFrom;

  String get name {
    switch (this) {
      case AddressType.from:
        return 'f';
      case AddressType.to:
        return 't';
      case AddressType.cc:
        return 'c';
      case AddressType.bcc:
        return 'b';
      case AddressType.replyTo:
        return 'r';
      case AddressType.sender:
        return 's';
      case AddressType.notification:
        return 'n';
      case AddressType.resentFrom:
        return 'rf';
    }
  }
}
