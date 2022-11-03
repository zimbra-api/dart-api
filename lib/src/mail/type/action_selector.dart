// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Action selector
class ActionSelector {
  /// Comma separated list of item IDs to act on. Required except for TagActionRequest,
  ///where the tags items can be specified using their tag names as an alternative.
  final String ids;

  /// The operation to perform
  /// For ItemAction    - delete|dumpsterdelete|recover|read|flag|priority|tag|move|trash|rename|update|color|lock|unlock|resetimapuid|copy
  /// For MsgAction     - delete|read|flag|tag|move|update|spam|trash
  /// For ConvAction    - delete|read|flag|priority|tag|move|spam|trash
  /// For FolderAction  - read|delete|rename|move|trash|empty|color|[!]grant|revokeorphangrants|url|import|sync|fb|[!]check|update|[!]syncon|retentionpolicy|[!]disableactivesync|webofflinesyncdays
  /// For TagAction     - read|rename|color|delete|update|retentionpolicy
  /// For ContactAction - move|delete|flag|trash|tag|update
  /// For DistributionListAction -
  ///    delete         delete the list
  ///    rename         rename the list
  ///    modify         modify the list
  ///    addOwners      add list owner
  ///    removeOwners   remove list owners
  ///    setOwners      set list owners
  ///    grantRights    grant rights
  ///    revokeRights   revoke rights
  ///    setRights      set rights
  ///    addMembers     add list members
  ///    removeMembers  remove list members
  ///    acceptSubsReq  accept subscription/un-subscription request
  ///    rejectSubsReq  reject subscription/un-subscription request
  ///    resetimapuid   reset IMAP item UIDs
  final String operation;

  /// List of characters; constrains the set of affected items in a conversation. t|j|s|d|o
  /// t:   include items in the Trash
  /// j:   include items in Spam/Junk
  /// s:   include items in the user's Sent folder (not necessarily "Sent")
  /// d:   include items in Drafts folder
  /// o:   include items in any other folder
  /// A leading '-' means to negate the constraint (e.g. "-t" means all messages not in Trash)
  final String? constraint;

  /// Deprecated - use "tn" instead
  final int? tag;

  /// Folder ID
  final String? folder;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// Name
  final String? name;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Flag to signify that any non-existent ids should be returned
  final bool? nonExistentIds;

  /// Flag to signify that ids of new items should be returned applies to COPY action
  final bool? newlyCreatedIds;

  ActionSelector(this.ids, this.operation,
      {this.constraint,
      this.tag,
      this.folder,
      this.rgb,
      this.color,
      this.name,
      this.flags,
      this.tags,
      this.tagNames,
      this.nonExistentIds,
      this.newlyCreatedIds});

  factory ActionSelector.fromMap(Map<String, dynamic> data) => ActionSelector(data['id'] ?? '', data['op'] ?? '',
      constraint: data['tcon'],
      tag: data['tag'],
      folder: data['l'],
      rgb: data['rgb'],
      color: data['color'],
      name: data['name'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      nonExistentIds: data['nei'],
      newlyCreatedIds: data['nci']);

  Map<String, dynamic> toMap() => {
        'id': ids,
        'op': operation,
        if (constraint != null) 'tcon': constraint,
        if (tag != null) 'tag': tag,
        if (folder != null) 'l': folder,
        if (rgb != null) 'rgb': rgb,
        if (color != null) 'color': color,
        if (name != null) 'name': name,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (nonExistentIds != null) 'nei': nonExistentIds,
        if (newlyCreatedIds != null) 'nci': newlyCreatedIds,
      };
}
