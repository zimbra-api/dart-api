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

  const SyncDeletedInfo(
    this.ids, {
    this.folderTypes = const [],
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
    this.docTypes = const [],
  });

  factory SyncDeletedInfo.fromMap(Map<String, dynamic> data) => SyncDeletedInfo(data['ids'],
      folderTypes: (data['folder'] is Iterable)
          ? (data['folder'] as Iterable).map<IdsAttr>((folder) => IdsAttr.fromMap(folder)).toList(growable: false)
          : const [],
      searchTypes: (data['search'] is Iterable)
          ? (data['search'] as Iterable).map<IdsAttr>((search) => IdsAttr.fromMap(search)).toList(growable: false)
          : const [],
      linkTypes: (data['link'] is Iterable)
          ? (data['link'] as Iterable).map<IdsAttr>((link) => IdsAttr.fromMap(link)).toList(growable: false)
          : const [],
      tagTypes: (data['tag'] is Iterable)
          ? (data['tag'] as Iterable).map<IdsAttr>((tag) => IdsAttr.fromMap(tag)).toList(growable: false)
          : const [],
      convTypes: (data['c'] is Iterable)
          ? (data['c'] as Iterable).map<IdsAttr>((conv) => IdsAttr.fromMap(conv)).toList(growable: false)
          : const [],
      chatTypes: (data['chat'] is Iterable)
          ? (data['chat'] as Iterable).map<IdsAttr>((chat) => IdsAttr.fromMap(chat)).toList(growable: false)
          : const [],
      msgTypes: (data['m'] is Iterable)
          ? (data['m'] as Iterable).map<IdsAttr>((msg) => IdsAttr.fromMap(msg)).toList(growable: false)
          : const [],
      contactTypes: (data['cn'] is Iterable)
          ? (data['cn'] as Iterable).map<IdsAttr>((cn) => IdsAttr.fromMap(cn)).toList(growable: false)
          : const [],
      apptTypes: (data['appt'] is Iterable)
          ? (data['appt'] as Iterable).map<IdsAttr>((appt) => IdsAttr.fromMap(appt)).toList(growable: false)
          : const [],
      taskTypes: (data['task'] is Iterable)
          ? (data['task'] as Iterable).map<IdsAttr>((task) => IdsAttr.fromMap(task)).toList(growable: false)
          : const [],
      noteTypes: (data['notes'] is Iterable)
          ? (data['notes'] as Iterable).map<IdsAttr>((note) => IdsAttr.fromMap(note)).toList(growable: false)
          : const [],
      wikiTypes: (data['w'] is Iterable)
          ? (data['w'] as Iterable).map<IdsAttr>((wiki) => IdsAttr.fromMap(wiki)).toList(growable: false)
          : const [],
      docTypes: (data['doc'] is Iterable)
          ? (data['doc'] as Iterable).map<IdsAttr>((doc) => IdsAttr.fromMap(doc)).toList(growable: false)
          : []);

  Map<String, dynamic> toMap() => {
        'ids': ids,
        if (folderTypes.isNotEmpty) 'folder': folderTypes.map((folder) => folder.toMap()).toList(growable: false),
        if (searchTypes.isNotEmpty) 'search': searchTypes.map((search) => search.toMap()).toList(growable: false),
        if (linkTypes.isNotEmpty) 'link': linkTypes.map((link) => link.toMap()).toList(growable: false),
        if (tagTypes.isNotEmpty) 'tag': tagTypes.map((tag) => tag.toMap()).toList(growable: false),
        if (convTypes.isNotEmpty) 'c': convTypes.map((conv) => conv.toMap()).toList(growable: false),
        if (chatTypes.isNotEmpty) 'chat': chatTypes.map((chat) => chat.toMap()).toList(growable: false),
        if (msgTypes.isNotEmpty) 'm': msgTypes.map((msg) => msg.toMap()).toList(growable: false),
        if (contactTypes.isNotEmpty) 'cn': contactTypes.map((cn) => cn.toMap()).toList(growable: false),
        if (apptTypes.isNotEmpty) 'appt': apptTypes.map((appt) => appt.toMap()).toList(growable: false),
        if (taskTypes.isNotEmpty) 'task': taskTypes.map((task) => task.toMap()).toList(growable: false),
        if (noteTypes.isNotEmpty) 'notes': noteTypes.map((note) => note.toMap()).toList(growable: false),
        if (wikiTypes.isNotEmpty) 'w': wikiTypes.map((wiki) => wiki.toMap()).toList(growable: false),
        if (docTypes.isNotEmpty) 'doc': docTypes.map((doc) => doc.toMap()).toList(growable: false),
      };
}
