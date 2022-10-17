// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ViewType {
  unknown,
  searchFolder,
  tag,
  conversation,
  message,
  contact,
  document,
  appointment,
  virtualConversation,
  remoteFolder,
  wiki,
  task,
  chat;

  String get name {
    switch (this) {
      case ViewType.unknown:
        return '';
      case ViewType.searchFolder:
        return 'search folder';
      case ViewType.tag:
        return 'tag';
      case ViewType.conversation:
        return 'conversation';
      case ViewType.message:
        return 'message';
      case ViewType.contact:
        return 'contact';
      case ViewType.document:
        return 'document';
      case ViewType.appointment:
        return 'appointment';
      case ViewType.virtualConversation:
        return 'virtual conversation';
      case ViewType.remoteFolder:
        return 'remote folder';
      case ViewType.wiki:
        return 'wiki';
      case ViewType.task:
        return 'task';
      case ViewType.chat:
        return 'chat';
    }
  }
}
