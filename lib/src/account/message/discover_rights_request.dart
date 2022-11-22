// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'discover_rights_body.dart';
import 'discover_rights_envelope.dart';

/// Return all targets of the specified rights applicable to the requested account.
/// Notes:
/// 1. This call only discovers grants granted on the designated target type of the specified rights.
///    It does not return grants granted on target types the rights can inherit from.
/// 2. For sendAs, sendOnBehalfOf, sendAsDistList, sendOnBehalfOfDistList rights, name attribute
///    is not returned on <target> elements.
///    Instead, addresses in the target entry's zimbraPrefAllowAddressForDelegatedSender are returned
///    in <e a="{email-address}"/> elements under the <target> element.
///    If zimbraPrefAllowAddressForDelegatedSender is not set on the target entry, the entry's primary
///    email address will be return in the only <e a="{email-address}"/> element under the <target> element.
/// 3. For all other rights, name attribute is always returned on <target> elements,
///    no <e a="{email-address}"/> will be returned. name attribute contains the entry's primary name.
class DiscoverRightsRequest extends SoapRequest {
  /// The rights
  final List<String> rights;

  DiscoverRightsRequest({this.rights = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DiscoverRightsEnvelope(DiscoverRightsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (rights.isNotEmpty) 'right': rights.map((right) => {'_content': right}).toList(growable: false),
      };
}
