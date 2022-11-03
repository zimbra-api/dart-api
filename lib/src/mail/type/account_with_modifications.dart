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

  factory AccountWithModifications.fromMap(Map<String, dynamic> data) => AccountWithModifications(
      id: data['id'],
      modifications: (data['mods'] is Iterable)
          ? List.from((data['mods'] as Iterable)
              .map<PendingFolderModifications>((mods) => PendingFolderModifications.fromMap(mods)))
          : [],
      lastChangeId: data['changeid']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (modifications.isNotEmpty) 'mods': modifications.map((mods) => mods.toMap()).toList(),
        if (lastChangeId != null) 'changeid': lastChangeId,
      };
}
