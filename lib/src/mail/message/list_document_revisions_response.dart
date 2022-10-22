// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/document_info.dart';
import 'package:zimbra_api/src/mail/type/id_email_name.dart';

class ListDocumentRevisionsResponse extends SoapResponse {
  /// Document revision information
  final List<DocumentInfo> revisions;

  /// User information
  final List<IdEmailName> users;

  ListDocumentRevisionsResponse({this.revisions = const [], this.users = const []});

  factory ListDocumentRevisionsResponse.fromJson(Map<String, dynamic> json) => ListDocumentRevisionsResponse(
      revisions: (json['doc'] is Iterable)
          ? List.from((json['doc'] as Iterable).map<DocumentInfo>((doc) => DocumentInfo.fromJson(doc)))
          : [],
      users: (json['user'] is Iterable)
          ? List.from((json['user'] as Iterable).map<IdEmailName>((user) => IdEmailName.fromJson(user)))
          : []);
}
