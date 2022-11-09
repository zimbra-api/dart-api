// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/contact_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class SearchGalResponse extends SoapResponse {
  /// Name of attribute sorted on.
  final String? sortBy;

  /// The 0-based offset into the results list returned as the first result for this search operation.
  final int? offset;

  /// Flags whether there are more results
  final bool? more;

  /// Flag whether the underlying search supported pagination.
  /// true - limit and offset in the request was honored
  /// false - the underlying search does not support pagination. limit and offset in the request was not honored
  final bool? pagingSupported;

  /// Valid values: and|or
  /// - Not present if the search key was not tokenized.
  /// - Some clients backtrack on GAL results assuming the results of a more specific key is the subset of a more
  ///   generic key, and it checks cached results instead of issuing another SOAP request to the server.
  ///   If search key was tokenized and expanded with AND or OR, this cannot be assumed.
  final bool? tokenizeKey;

  /// Matching contacts
  final List<ContactInfo> contacts;

  SearchGalResponse({
    this.sortBy,
    this.offset,
    this.more,
    this.pagingSupported,
    this.tokenizeKey,
    this.contacts = const [],
  });

  factory SearchGalResponse.fromMap(Map<String, dynamic> data) => SearchGalResponse(
        sortBy: data['sortBy'],
        offset: int.tryParse(data['offset']?.toString() ?? ''),
        more: data['more'],
        pagingSupported: data['paginationSupported'],
        tokenizeKey: data['tokenizeKey'],
        contacts: (data['cn'] is Iterable)
            ? List.from((data['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromMap(cn)))
            : [],
      );
}
