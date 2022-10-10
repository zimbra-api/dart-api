// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/contact_info.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

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

  SyncGalResponse(
      {this.more,
      this.token,
      this.galDefinitionLastModified,
      this.throttled,
      this.fullSyncRecommended,
      this.remain,
      this.contacts = const [],
      this.deleted = const []});

  factory SyncGalResponse.fromJson(Map<String, dynamic> json) {
    final contacts = <ContactInfo>[];
    if (json['cn'] != null && json['cn'] is Iterable) {
      final elements = json['cn'] as Iterable;
      for (final cn in elements) {
        contacts.add(ContactInfo.fromJson(cn));
      }
    }

    final deleted = <Id>[];
    if (json['deleted'] != null && json['deleted'] is Iterable) {
      final elements = json['deleted'] as Iterable;
      for (final id in elements) {
        deleted.add(Id.fromJson(id));
      }
    }

    return SyncGalResponse(
        more: json['more'],
        token: json['token'],
        galDefinitionLastModified: json['galDefinitionLastModified'],
        throttled: json['throttled'],
        fullSyncRecommended: json['fullSyncRecommended'],
        remain: json['remain'],
        contacts: contacts,
        deleted: deleted);
  }
}
