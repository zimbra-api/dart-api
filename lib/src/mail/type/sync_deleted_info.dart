// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'ids_attr.dart';

class SyncDeletedInfo {
  /// IDs of deleted items
  final String ids;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> folderTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> searchTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> linkTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> tagTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> convTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> chatTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> msgTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> contactTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> apptTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> taskTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> noteTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> wikiTypes;

  /// Details of deletes broken down by item type (present if "typed" was specified in the request)
  final List<IdsAttr> docTypes;

  SyncDeletedInfo(this.ids,
      {this.folderTypes = const [],
      this.searchTypes = const [],
      this.linkTypes = const [],
      this.tagTypes = const [],
      this.convTypes = const [],
      this.chatTypes = const [],
      this.msgTypes = const [],
      this.contactTypes = const [],
      this.apptTypes = const [],
      this.taskTypes = const [],
      this.noteTypes = const [],
      this.wikiTypes = const [],
      this.docTypes = const []});

  factory SyncDeletedInfo.fromJson(Map<String, dynamic> json) => SyncDeletedInfo(json['ids'],
      folderTypes: (json['folder'] is Iterable)
          ? List.from((json['folder'] as Iterable).map<IdsAttr>((folder) => IdsAttr.fromJson(folder)))
          : [],
      searchTypes: (json['search'] is Iterable)
          ? List.from((json['search'] as Iterable).map<IdsAttr>((search) => IdsAttr.fromJson(search)))
          : [],
      linkTypes: (json['link'] is Iterable)
          ? List.from((json['link'] as Iterable).map<IdsAttr>((link) => IdsAttr.fromJson(link)))
          : [],
      tagTypes: (json['tag'] is Iterable)
          ? List.from((json['tag'] as Iterable).map<IdsAttr>((tag) => IdsAttr.fromJson(tag)))
          : [],
      convTypes: (json['c'] is Iterable)
          ? List.from((json['c'] as Iterable).map<IdsAttr>((conv) => IdsAttr.fromJson(conv)))
          : [],
      chatTypes: (json['chat'] is Iterable)
          ? List.from((json['chat'] as Iterable).map<IdsAttr>((chat) => IdsAttr.fromJson(chat)))
          : [],
      msgTypes: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<IdsAttr>((msg) => IdsAttr.fromJson(msg)))
          : [],
      contactTypes: (json['cn'] is Iterable)
          ? List.from((json['cn'] as Iterable).map<IdsAttr>((cn) => IdsAttr.fromJson(cn)))
          : [],
      apptTypes: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<IdsAttr>((appt) => IdsAttr.fromJson(appt)))
          : [],
      taskTypes: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<IdsAttr>((task) => IdsAttr.fromJson(task)))
          : [],
      noteTypes: (json['notes'] is Iterable)
          ? List.from((json['notes'] as Iterable).map<IdsAttr>((note) => IdsAttr.fromJson(note)))
          : [],
      wikiTypes: (json['w'] is Iterable)
          ? List.from((json['w'] as Iterable).map<IdsAttr>((wiki) => IdsAttr.fromJson(wiki)))
          : [],
      docTypes: (json['doc'] is Iterable)
          ? List.from((json['doc'] as Iterable).map<IdsAttr>((doc) => IdsAttr.fromJson(doc)))
          : []);

  Map<String, dynamic> toJson() => {
        'ids': ids,
        if (folderTypes.isNotEmpty) 'folder': folderTypes.map((folder) => folder.toJson()).toList(),
        if (searchTypes.isNotEmpty) 'search': searchTypes.map((search) => search.toJson()).toList(),
        if (linkTypes.isNotEmpty) 'link': linkTypes.map((link) => link.toJson()).toList(),
        if (tagTypes.isNotEmpty) 'tag': tagTypes.map((tag) => tag.toJson()).toList(),
        if (convTypes.isNotEmpty) 'c': convTypes.map((conv) => conv.toJson()).toList(),
        if (chatTypes.isNotEmpty) 'chat': chatTypes.map((chat) => chat.toJson()).toList(),
        if (msgTypes.isNotEmpty) 'm': msgTypes.map((msg) => msg.toJson()).toList(),
        if (contactTypes.isNotEmpty) 'cn': contactTypes.map((cn) => cn.toJson()).toList(),
        if (apptTypes.isNotEmpty) 'appt': apptTypes.map((appt) => appt.toJson()).toList(),
        if (taskTypes.isNotEmpty) 'task': taskTypes.map((task) => task.toJson()).toList(),
        if (noteTypes.isNotEmpty) 'notes': noteTypes.map((note) => note.toJson()).toList(),
        if (wikiTypes.isNotEmpty) 'w': wikiTypes.map((wiki) => wiki.toJson()).toList(),
        if (docTypes.isNotEmpty) 'doc': docTypes.map((doc) => doc.toJson()).toList(),
      };
}
