// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'pending_folder_modifications.dart';

class AccountWithModifications {
  /// Account ID
  final int? id;

  /// Serialized pending modifications per folder
  final List<PendingFolderModifications> modifications;

  /// ID of the last change
  final int? lastChangeId;

  AccountWithModifications({this.id, this.modifications = const [], this.lastChangeId});

  factory AccountWithModifications.fromJson(Map<String, dynamic> json) => AccountWithModifications(
      id: json['id'],
      modifications: (json['mods'] is Iterable)
          ? List.from((json['mods'] as Iterable)
              .map<PendingFolderModifications>((mods) => PendingFolderModifications.fromJson(mods)))
          : [],
      lastChangeId: json['changeid']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (modifications.isNotEmpty) 'mods': modifications.map((mods) => mods.toJson()).toList(),
        if (lastChangeId != null) 'changeid': lastChangeId,
      };
}
