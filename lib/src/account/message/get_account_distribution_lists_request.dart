// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/member_of_selector.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'get_account_distribution_lists_body.dart';
import 'get_account_distribution_lists_envelope.dart';

/// Returns groups the user is either a member or an owner of.
/// Notes:
///   - isOwner is returned only if ownerOf on the request is 1 (true).
///   - isMember is returned only if memberOf on the request is not "none".
class GetAccountDistributionListsRequest extends SoapRequest {
  /// Set to true if the response should include groups the user is an owner of.
  /// Set to false (default) if do not need to know which groups the user is an owner of.
  final bool? ownerOf;

  /// Possible values: all|directOnly|none
  final MemberOfSelector? memberOf;

  /// comma-seperated attributes to return.
  /// Note: non-owner user can see only certain attributes of a group.
  /// If a specified attribute is not visible to the user, it will not be returned.
  final String? attrs;

  GetAccountDistributionListsRequest({this.ownerOf, this.memberOf, this.attrs});

  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      GetAccountDistributionListsEnvelope(
        GetAccountDistributionListsBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (ownerOf != null) 'ownerOf': ownerOf,
        if (memberOf != null) 'memberOf': memberOf!.name,
        if (attrs != null) 'attrs': attrs,
      };
}
