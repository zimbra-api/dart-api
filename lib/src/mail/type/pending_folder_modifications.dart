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

  factory PendingFolderModifications.fromJson(Map<String, dynamic> json) => PendingFolderModifications(
      folderId: json['id'] ?? 0,
      created: (json['created'] is Iterable)
          ? List.from((json['created'] as Iterable)
              .map<CreateItemNotification>((created) => CreateItemNotification.fromJson(created)))
          : [],
      deleted: (json['deleted'] is Iterable)
          ? List.from((json['deleted'] as Iterable)
              .map<DeleteItemNotification>((deleted) => DeleteItemNotification.fromJson(deleted)))
          : [],
      modifiedMsgs: (json['modMsgs'] is Iterable)
          ? List.from((json['modMsgs'] as Iterable)
              .map<ModifyItemNotification>((modMsgs) => ModifyItemNotification.fromJson(modMsgs)))
          : [],
      modifiedTags: (json['modTags'] is Iterable)
          ? List.from((json['modTags'] as Iterable)
              .map<ModifyTagNotification>((modTags) => ModifyTagNotification.fromJson(modTags)))
          : [],
      modifiedFolders: (json['modFolders'] is Iterable)
          ? List.from((json['modFolders'] as Iterable).map<RenameFolderNotification>((modFolders) => RenameFolderNotification.fromJson(modFolders)))
          : []);

  Map<String, dynamic> toJson() => {
        'id': folderId,
        if (created.isNotEmpty) 'created': created.map((created) => created.toJson()).toList(),
        if (deleted.isNotEmpty) 'deleted': deleted.map((deleted) => deleted.toJson()).toList(),
        if (modifiedMsgs.isNotEmpty) 'modMsgs': modifiedMsgs.map((modMsgs) => modMsgs.toJson()).toList(),
        if (modifiedTags.isNotEmpty) 'modTags': modifiedTags.map((modTags) => modTags.toJson()).toList(),
        if (modifiedFolders.isNotEmpty) 'modFolders': modifiedFolders.map((modFolders) => modFolders.toJson()).toList(),
      };
}
