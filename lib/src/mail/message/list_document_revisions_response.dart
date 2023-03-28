// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/document_info.dart';
import '../type/id_email_name.dart';

class ListDocumentRevisionsResponse extends SoapResponse {
  /// Document revision information
  final List<DocumentInfo> revisions;

  /// User information
  final List<IdEmailName> users;

  ListDocumentRevisionsResponse({this.revisions = const [], this.users = const []});

  factory ListDocumentRevisionsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ListDocumentRevisionsResponse(
        revisions: (data['doc'] is Iterable)
            ? (data['doc'] as Iterable)
                .map<DocumentInfo>(
                  (doc) => DocumentInfo.fromMap(doc),
                )
                .toList(growable: false)
            : const [],
        users: (data['user'] is Iterable)
            ? (data['user'] as Iterable)
                .map<IdEmailName>(
                  (user) => IdEmailName.fromMap(user),
                )
                .toList(growable: false)
            : const [],
      );
}
