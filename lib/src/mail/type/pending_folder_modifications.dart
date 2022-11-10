// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'create_item_notification.dart';
import 'delete_item_notification.dart';
import 'modify_item_notification.dart';
import 'modify_tag_notification.dart';
import 'rename_folder_notification.dart';

class PendingFolderModifications {
  /// ID of signaled folder
  final int folderId;

  /// list of created items
  final List<CreateItemNotification> created;

  /// list of deleted items
  final List<DeleteItemNotification> deleted;

  /// list of modified messages
  final List<ModifyItemNotification> modifiedMsgs;

  /// list of modified tags
  final List<ModifyTagNotification> modifiedTags;

  /// list of renamed folders
  final List<RenameFolderNotification> modifiedFolders;

  PendingFolderModifications(
      {this.folderId = 0,
      this.created = const [],
      this.deleted = const [],
      this.modifiedMsgs = const [],
      this.modifiedTags = const [],
      this.modifiedFolders = const []});

  factory PendingFolderModifications.fromMap(Map<String, dynamic> data) => PendingFolderModifications(
      folderId: int.tryParse(data['id']?.toString() ?? '') ?? 0,
      created: (data['created'] is Iterable)
          ? (data['created'] as Iterable)
              .map<CreateItemNotification>((created) => CreateItemNotification.fromMap(created))
              .toList(growable: false)
          : const [],
      deleted: (data['deleted'] is Iterable)
          ? (data['deleted'] as Iterable)
              .map<DeleteItemNotification>((deleted) => DeleteItemNotification.fromMap(deleted))
              .toList(growable: false)
          : const [],
      modifiedMsgs: (data['modMsgs'] is Iterable)
          ? (data['modMsgs'] as Iterable)
              .map<ModifyItemNotification>((modMsgs) => ModifyItemNotification.fromMap(modMsgs))
              .toList(growable: false)
          : const [],
      modifiedTags: (data['modTags'] is Iterable)
          ? (data['modTags'] as Iterable)
              .map<ModifyTagNotification>((modTags) => ModifyTagNotification.fromMap(modTags))
              .toList(growable: false)
          : const [],
      modifiedFolders: (data['modFolders'] is Iterable)
          ? (data['modFolders'] as Iterable)
              .map<RenameFolderNotification>((modFolders) => RenameFolderNotification.fromMap(modFolders))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        'id': folderId,
        if (created.isNotEmpty) 'created': created.map((created) => created.toMap()).toList(growable: false),
        if (deleted.isNotEmpty) 'deleted': deleted.map((deleted) => deleted.toMap()).toList(growable: false),
        if (modifiedMsgs.isNotEmpty) 'modMsgs': modifiedMsgs.map((modMsgs) => modMsgs.toMap()).toList(growable: false),
        if (modifiedTags.isNotEmpty) 'modTags': modifiedTags.map((modTags) => modTags.toMap()).toList(growable: false),
        if (modifiedFolders.isNotEmpty)
          'modFolders': modifiedFolders.map((modFolders) => modFolders.toMap()).toList(growable: false),
      };
}
