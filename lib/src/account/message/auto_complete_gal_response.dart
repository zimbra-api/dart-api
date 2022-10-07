// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/contact_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

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
  final List<ContactInfo> contacts = <ContactInfo>[];

  AutoCompleteGalResponse({this.more, this.tokenizeKey, this.pagingSupported});

  factory AutoCompleteGalResponse.fromJson(json) {
    final response = AutoCompleteGalResponse(
        more: json['more'], tokenizeKey: json['tokenizeKey'], pagingSupported: json['paginationSupported']);

    if (json['cn'] != null && json['cn'] is Iterable) {
      final contacts = json['cn'] as Iterable;
      for (final cn in contacts) {
        response.contacts.add(ContactInfo.fromJson(cn));
      }
    }

    return response;
  }
}
