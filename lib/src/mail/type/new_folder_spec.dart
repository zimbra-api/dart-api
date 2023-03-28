// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/view_type.dart';
import 'action_grant_selector.dart';

/// Input for creating a new folder
class NewFolderSpec {
  /// If parentFolderId is unset, name is the full path of the new folder;
  /// otherwise, name may not contain the folder separator '/'
  final String name;

  /// Default type for the folder; used by web client to decide which view to use;
  /// possible values are the same as SearchRequest's {types}: conversation|message|contact|etc
  final ViewType? defaultView;

  /// Flags
  final String? flags;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// URL (RSS, iCal, etc.) this folder syncs its contents to
  final String? url;

  /// Parent folder ID
  final String? parentFolderId;

  /// If set, the server will fetch the folder if it already exists rather than throwing mail.ALREADY_EXISTS
  final bool? fetchIfExists;

  /// If set (default) then if 'url' is set, synchronize folder content on folder creation
  final bool? syncToUrl;

  /// Grant specification
  final List<ActionGrantSelector> grants;

  const NewFolderSpec(
    this.name, {
    this.defaultView,
    this.flags,
    this.color,
    this.rgb,
    this.url,
    this.parentFolderId,
    this.fetchIfExists,
    this.syncToUrl,
    this.grants = const [],
  });

  factory NewFolderSpec.fromMap(Map<String, dynamic> data) => NewFolderSpec(
        data['name'] ?? '',
        defaultView: ViewType.values.firstWhere(
          (view) => view.name == data['view'],
          orElse: () => ViewType.conversation,
        ),
        flags: data['f'],
        color: int.tryParse(data['color']?.toString() ?? ''),
        rgb: data['rgb'],
        url: data['url'],
        parentFolderId: data['l'],
        fetchIfExists: data['fie'],
        syncToUrl: data['sync'],
        grants: data['acl']?[0]['grant'] is Iterable
            ? (data['acl'][0]['grant'] as Iterable)
                .map<ActionGrantSelector>(
                  (grant) => ActionGrantSelector.fromMap(grant),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        if (defaultView != null) 'view': defaultView!.name,
        if (flags != null) 'f': flags,
        if (color != null) 'color': color,
        if (rgb != null) 'rgb': rgb,
        if (url != null) 'url': url,
        if (parentFolderId != null) 'l': parentFolderId,
        if (fetchIfExists != null) 'fie': fetchIfExists,
        if (syncToUrl != null) 'sync': syncToUrl,
        if (grants.isNotEmpty)
          'acl': [
            {
              'grant': grants
                  .map(
                    (grant) => grant.toMap(),
                  )
                  .toList(growable: false)
            }
          ],
      };
}
