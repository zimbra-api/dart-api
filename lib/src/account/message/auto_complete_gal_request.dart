// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/gal_search_type.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'auto_complete_gal_envelope.dart';
import 'auto_complete_gal_body.dart';

/// Perform an autocomplete for a name against the Global Address List
/// The number of entries in the response is limited by Account/COS attribute zimbraContactAutoCompleteMaxResults with
/// default value of 20.
class AutoCompleteGalRequest extends SoapRequest {
  // The name to test for autocompletion
  String name;

  // type of addresses to auto-complete on
  // - "account" for regular user accounts, aliases and distribution lists
  // - "resource" for calendar resources
  // - "group" for groups
  // - "all" for combination of all types
  // if omitted, defaults to "account"
  GalSearchType? type;

  // flag whether the {exp} flag is needed in the response for group entries.
  // default is false
  bool? needCanExpand;

  // GAL Account ID
  String? galAccountId;

  // An int specifying the maximum number of results to return
  int? limit;

  AutoCompleteGalRequest(this.name, {this.type, this.needCanExpand, this.galAccountId, this.limit});

  @override
  SoapEnvelope getEnvelope() => AutoCompleteGalEnvelope(AutoCompleteGalBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'name': name,
        if (type != null) 'type': type!.name,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (galAccountId != null) 'galAcctId': galAccountId,
        if (limit != null) 'limit': limit,
      };
}
