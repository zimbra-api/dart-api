// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/contact_info.dart';

class AutoCompleteGalResponse extends SoapResponse {
  // Set to 1 if the results were truncated
  final bool? more;

  // Either "and" or "or" (if present)
  // - Not present if the search key was not tokenized.
  // - Some clients backtrack on GAL results assuming the results of a more specific key is the subset of a more generic key,
  //   and it checks cached results instead of issuing another SOAP request to the server.
  //   If search key was tokenized and expanded with AND or OR, this cannot be assumed.
  final bool? tokenizeKey;

  // Flag if pagination is supported
  final bool? pagingSupported;

  // Contacts matching the autocomplete request
  final List<ContactInfo> contacts;

  AutoCompleteGalResponse({
    this.more,
    this.tokenizeKey,
    this.pagingSupported,
    this.contacts = const [],
  });

  factory AutoCompleteGalResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      AutoCompleteGalResponse(
        more: data['more'],
        tokenizeKey: data['tokenizeKey'],
        pagingSupported: data['paginationSupported'],
        contacts: (data['cn'] is Iterable)
            ? (data['cn'] as Iterable)
                .map<ContactInfo>(
                  (cn) => ContactInfo.fromMap(cn),
                )
                .toList(growable: false)
            : const [],
      );
}
