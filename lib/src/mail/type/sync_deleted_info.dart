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

  factory SyncDeletedInfo.fromMap(Map<String, dynamic> data) => SyncDeletedInfo(data['ids'],
      folderTypes: (data['folder'] is Iterable)
          ? List.from((data['folder'] as Iterable).map<IdsAttr>((folder) => IdsAttr.fromMap(folder)))
          : [],
      searchTypes: (data['search'] is Iterable)
          ? List.from((data['search'] as Iterable).map<IdsAttr>((search) => IdsAttr.fromMap(search)))
          : [],
      linkTypes: (data['link'] is Iterable)
          ? List.from((data['link'] as Iterable).map<IdsAttr>((link) => IdsAttr.fromMap(link)))
          : [],
      tagTypes: (data['tag'] is Iterable)
          ? List.from((data['tag'] as Iterable).map<IdsAttr>((tag) => IdsAttr.fromMap(tag)))
          : [],
      convTypes: (data['c'] is Iterable)
          ? List.from((data['c'] as Iterable).map<IdsAttr>((conv) => IdsAttr.fromMap(conv)))
          : [],
      chatTypes: (data['chat'] is Iterable)
          ? List.from((data['chat'] as Iterable).map<IdsAttr>((chat) => IdsAttr.fromMap(chat)))
          : [],
      msgTypes: (data['m'] is Iterable)
          ? List.from((data['m'] as Iterable).map<IdsAttr>((msg) => IdsAttr.fromMap(msg)))
          : [],
      contactTypes: (data['cn'] is Iterable)
          ? List.from((data['cn'] as Iterable).map<IdsAttr>((cn) => IdsAttr.fromMap(cn)))
          : [],
      apptTypes: (data['appt'] is Iterable)
          ? List.from((data['appt'] as Iterable).map<IdsAttr>((appt) => IdsAttr.fromMap(appt)))
          : [],
      taskTypes: (data['task'] is Iterable)
          ? List.from((data['task'] as Iterable).map<IdsAttr>((task) => IdsAttr.fromMap(task)))
          : [],
      noteTypes: (data['notes'] is Iterable)
          ? List.from((data['notes'] as Iterable).map<IdsAttr>((note) => IdsAttr.fromMap(note)))
          : [],
      wikiTypes: (data['w'] is Iterable)
          ? List.from((data['w'] as Iterable).map<IdsAttr>((wiki) => IdsAttr.fromMap(wiki)))
          : [],
      docTypes: (data['doc'] is Iterable)
          ? List.from((data['doc'] as Iterable).map<IdsAttr>((doc) => IdsAttr.fromMap(doc)))
          : []);

  Map<String, dynamic> toMap() => {
        'ids': ids,
        if (folderTypes.isNotEmpty) 'folder': folderTypes.map((folder) => folder.toMap()).toList(),
        if (searchTypes.isNotEmpty) 'search': searchTypes.map((search) => search.toMap()).toList(),
        if (linkTypes.isNotEmpty) 'link': linkTypes.map((link) => link.toMap()).toList(),
        if (tagTypes.isNotEmpty) 'tag': tagTypes.map((tag) => tag.toMap()).toList(),
        if (convTypes.isNotEmpty) 'c': convTypes.map((conv) => conv.toMap()).toList(),
        if (chatTypes.isNotEmpty) 'chat': chatTypes.map((chat) => chat.toMap()).toList(),
        if (msgTypes.isNotEmpty) 'm': msgTypes.map((msg) => msg.toMap()).toList(),
        if (contactTypes.isNotEmpty) 'cn': contactTypes.map((cn) => cn.toMap()).toList(),
        if (apptTypes.isNotEmpty) 'appt': apptTypes.map((appt) => appt.toMap()).toList(),
        if (taskTypes.isNotEmpty) 'task': taskTypes.map((task) => task.toMap()).toList(),
        if (noteTypes.isNotEmpty) 'notes': noteTypes.map((note) => note.toMap()).toList(),
        if (wikiTypes.isNotEmpty) 'w': wikiTypes.map((wiki) => wiki.toMap()).toList(),
        if (docTypes.isNotEmpty) 'doc': docTypes.map((doc) => doc.toMap()).toList(),
      };
}
