// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id.dart';
import '../../common/type/soap_response.dart';
import '../type/contact_info.dart';

class SyncGalResponse extends SoapResponse {
  /// Flags whether there are more results
  final bool? more;

  /// New synchronization token
  final String? token;

  /// galDefinitionLastModified is the time at which the GAL definition is last modified.
  /// This is returned if the sync does not happen using GAL sync account.
  final String? galDefinitionLastModified;

  /// True if the SyncGal request is throttled
  final bool? throttled;

  /// True if the fullSync is recommended
  final bool? fullSyncRecommended;

  /// count of records still to be returned in paginated response
  final int? remain;

  /// Details of contact
  final List<ContactInfo> contacts;

  /// Details of deleted entries
  final List<Id> deleted;

  SyncGalResponse({
    this.more,
    this.token,
    this.galDefinitionLastModified,
    this.throttled,
    this.fullSyncRecommended,
    this.remain,
    this.contacts = const [],
    this.deleted = const [],
  });

  factory SyncGalResponse.fromMap(Map<String, dynamic> data) => SyncGalResponse(
        more: data['more'],
        token: data['token'],
        galDefinitionLastModified: data['galDefinitionLastModified'],
        throttled: data['throttled'],
        fullSyncRecommended: data['fullSyncRecommended'],
        remain: int.tryParse(data['remain']?.toString() ?? ''),
        contacts: (data['cn'] is Iterable)
            ? (data['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromMap(cn)).toList(growable: false)
            : const [],
        deleted: (data['deleted'] is Iterable)
            ? (data['deleted'] as Iterable).map<Id>((deleted) => Id.fromMap(deleted)).toList(growable: false)
            : const [],
      );
}
