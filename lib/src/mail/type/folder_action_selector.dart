// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/grantee_type.dart';

import 'action_grant_selector.dart';
import 'action_selector.dart';
import 'retention_policy.dart';

/// Input for folder actions
class FolderActionSelector extends ActionSelector {
  /// For op=empty - hard-delete all items in the folder (and all the folder's subfolders if "recursive" is set)
  final bool? recursive;

  /// Target URL
  final String? url;

  /// For fb operation - set the excludeFreeBusy bool for this folder (must specify for fb operation)
  final bool? excludeFreeBusy;

  /// Grantee Zimbra ID
  final String? zimbraId;

  /// Grantee type
  final GranteeType? grantType;

  /// User with op=update to change folder's default view (usefor for migration)
  final String? view;

  /// Grant
  final ActionGrantSelector? grant;

  /// List of grants used with op=grant and op=!grant
  final List<ActionGrantSelector> grants;

  /// Retention policy
  final RetentionPolicy? retentionPolicy;

  /// Number of days for which web client would sync folder data for offline use
  final int? numDays;

  FolderActionSelector(super.ids, super.operation,
      {super.constraint,
      super.tag,
      super.folder,
      super.rgb,
      super.color,
      super.name,
      super.flags,
      super.tags,
      super.tagNames,
      super.nonExistentIds,
      super.newlyCreatedIds,
      this.recursive,
      this.url,
      this.excludeFreeBusy,
      this.zimbraId,
      this.grantType,
      this.view,
      this.grant,
      this.grants = const [],
      this.retentionPolicy,
      this.numDays});

  factory FolderActionSelector.fromJson(Map<String, dynamic> json) =>
      FolderActionSelector(json['id'] ?? '', json['op'] ?? '',
          constraint: json['tcon'],
          tag: json['tag'],
          folder: json['l'],
          rgb: json['rgb'],
          color: json['color'],
          name: json['name'],
          flags: json['f'],
          tags: json['t'],
          tagNames: json['tn'],
          nonExistentIds: json['nei'],
          newlyCreatedIds: json['nci'],
          recursive: json['recursive'],
          url: json['url'],
          excludeFreeBusy: json['excludeFreeBusy'],
          zimbraId: json['zid'],
          grantType: GranteeType.values.firstWhere(
            (gt) => gt.name == json['gt'],
            orElse: () => GranteeType.all,
          ),
          view: json['view'],
          grant: json['grant'] is Map ? ActionGrantSelector.fromJson(json['grant']) : null,
          grants: (json['acl']?['grant'] is Iterable)
              ? List.from((json['acl']['grant'] as Iterable)
                  .map<ActionGrantSelector>((grant) => ActionGrantSelector.fromJson(grant)))
              : [],
          retentionPolicy: json['retentionPolicy'] is Map ? RetentionPolicy.fromJson(json['retentionPolicy']) : null,
          numDays: json['numDays']);

  @override
  Map<String, dynamic> toJson() => {
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
        if (recursive != null) 'recursive': recursive,
        if (url != null) 'url': url,
        if (excludeFreeBusy != null) 'excludeFreeBusy': excludeFreeBusy,
        if (zimbraId != null) 'zid': zimbraId,
        if (grantType != null) 'gt': grantType!.name,
        if (view != null) 'view': view,
        if (grant != null) 'grant': grant!.toJson(),
        if (grants.isNotEmpty) 'acl': {'grant': grants.map((grant) => grant.toJson()).toList()},
        if (retentionPolicy != null) 'retentionPolicy': retentionPolicy!.toJson(),
        if (numDays != null) 'numDays': numDays,
      };
}