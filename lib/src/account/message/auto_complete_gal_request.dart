// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/gal_search_type.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'auto_complete_gal_envelope.dart';
import 'auto_complete_gal_body.dart';

/// Perform an autocomplete for a name against the Global Address List
/// The number of entries in the response is limited by Account/COS attribute zimbraContactAutoCompleteMaxResults with
/// default value of 20.
class AutoCompleteGalRequest extends SoapRequest {
  // The name to test for autocompletion
  final String name;

  // type of addresses to auto-complete on
  // - "account" for regular user accounts, aliases and distribution lists
  // - "resource" for calendar resources
  // - "group" for groups
  // - "all" for combination of all types
  // if omitted, defaults to "account"
  final GalSearchType? type;

  // flag whether the {exp} flag is needed in the response for group entries.
  // default is false
  final bool? needCanExpand;

  // GAL Account ID
  final String? galAccountId;

  // An int specifying the maximum number of results to return
  final int? limit;

  AutoCompleteGalRequest(
    this.name, {
    this.type,
    this.needCanExpand,
    this.galAccountId,
    this.limit,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => AutoCompleteGalEnvelope(
        AutoCompleteGalBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'name': name,
        if (type != null) 'type': type!.name,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (galAccountId != null) 'galAcctId': galAccountId,
        if (limit != null) 'limit': limit,
      };
}
