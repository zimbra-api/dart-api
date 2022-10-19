// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum FolderAction {
  read,
  delete,
  rename,
  move,
  trash,
  empty,
  color,
  grant,
  notGrant,
  revokeOrphanGrants,
  url,
  import,
  sync,
  fb,
  check,
  notCheck,
  update,
  syncon,
  notSyncon,
  retentionPolicy,
  disableActiveSync,
  notDisableActiveSync,
  webOfflineSyncDays;

  String get name {
    switch (this) {
      case FolderAction.read:
        return 'read';
      case FolderAction.delete:
        return 'delete';
      case FolderAction.rename:
        return 'move';
      case FolderAction.move:
        return 'move';
      case FolderAction.trash:
        return 'trash';
      case FolderAction.empty:
        return 'empty';
      case FolderAction.color:
        return 'color';
      case FolderAction.grant:
        return 'grant';
      case FolderAction.notGrant:
        return '!grant';
      case FolderAction.revokeOrphanGrants:
        return 'revokeorphangrants';
      case FolderAction.url:
        return 'url';
      case FolderAction.import:
        return 'import';
      case FolderAction.sync:
        return 'sync';
      case FolderAction.fb:
        return 'fb';
      case FolderAction.check:
        return 'check';
      case FolderAction.notCheck:
        return '!check';
      case FolderAction.update:
        return 'update';
      case FolderAction.syncon:
        return 'syncon';
      case FolderAction.notSyncon:
        return '!syncon';
      case FolderAction.retentionPolicy:
        return 'retentionpolicy';
      case FolderAction.disableActiveSync:
        return 'disableactivesync';
      case FolderAction.notDisableActiveSync:
        return 'notdisableactivesync';
      case FolderAction.webOfflineSyncDays:
        return 'webofflinesyncdays';
    }
  }
}
