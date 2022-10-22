// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum MailItemType {
  unknown,
  folder,
  searchFolder,
  tag,
  conversation,
  message,
  contact,
  invite,
  document,
  note,
  flag,
  appointment,
  virtualConversation,
  mountpoint,
  wiki,
  task,
  chat,
  comment,
  link;

  String get name {
    switch (this) {
      case MailItemType.unknown:
        return 'UNKNOWN';
      case MailItemType.folder:
        return 'FOLDER';
      case MailItemType.searchFolder:
        return 'SEARCHFOLDER';
      case MailItemType.tag:
        return 'TAG';
      case MailItemType.conversation:
        return 'CONVERSATION';
      case MailItemType.message:
        return 'MESSAGE';
      case MailItemType.contact:
        return 'CONTACT';
      case MailItemType.invite:
        return 'INVITE';
      case MailItemType.document:
        return 'DOCUMENT';
      case MailItemType.note:
        return 'NOTE';
      case MailItemType.flag:
        return 'FLAG';
      case MailItemType.appointment:
        return 'APPOINTMENT';
      case MailItemType.virtualConversation:
        return 'VIRTUAL_CONVERSATION';
      case MailItemType.mountpoint:
        return 'MOUNTPOINT';
      case MailItemType.wiki:
        return 'WIKI';
      case MailItemType.task:
        return 'TASK';
      case MailItemType.chat:
        return 'CHAT';
      case MailItemType.comment:
        return 'COMMENT';
      case MailItemType.link:
        return 'LINK';
    }
  }
}
