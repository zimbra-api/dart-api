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
          ? List.from((data['created'] as Iterable)
              .map<CreateItemNotification>((created) => CreateItemNotification.fromMap(created)))
          : [],
      deleted: (data['deleted'] is Iterable)
          ? List.from((data['deleted'] as Iterable)
              .map<DeleteItemNotification>((deleted) => DeleteItemNotification.fromMap(deleted)))
          : [],
      modifiedMsgs: (data['modMsgs'] is Iterable)
          ? List.from((data['modMsgs'] as Iterable)
              .map<ModifyItemNotification>((modMsgs) => ModifyItemNotification.fromMap(modMsgs)))
          : [],
      modifiedTags: (data['modTags'] is Iterable)
          ? List.from((data['modTags'] as Iterable)
              .map<ModifyTagNotification>((modTags) => ModifyTagNotification.fromMap(modTags)))
          : [],
      modifiedFolders: (data['modFolders'] is Iterable)
          ? List.from((data['modFolders'] as Iterable).map<RenameFolderNotification>((modFolders) => RenameFolderNotification.fromMap(modFolders)))
          : []);

  Map<String, dynamic> toMap() => {
        'id': folderId,
        if (created.isNotEmpty) 'created': created.map((created) => created.toMap()).toList(),
        if (deleted.isNotEmpty) 'deleted': deleted.map((deleted) => deleted.toMap()).toList(),
        if (modifiedMsgs.isNotEmpty) 'modMsgs': modifiedMsgs.map((modMsgs) => modMsgs.toMap()).toList(),
        if (modifiedTags.isNotEmpty) 'modTags': modifiedTags.map((modTags) => modTags.toMap()).toList(),
        if (modifiedFolders.isNotEmpty) 'modFolders': modifiedFolders.map((modFolders) => modFolders.toMap()).toList(),
      };
}
