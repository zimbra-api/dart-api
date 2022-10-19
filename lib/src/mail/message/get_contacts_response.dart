// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/contact_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetContactsResponse extends SoapResponse {
  /// Contact information
  final List<ContactInfo> contacts;

  GetContactsResponse({this.contacts = const []});

  factory GetContactsResponse.fromJson(Map<String, dynamic> json) => GetContactsResponse(
      contacts: (json['cn'] is Iterable)
          ? List.from((json['cn'] as Iterable).map<ContactInfo>((cn) => ContactInfo.fromJson(cn)))
          : []);
}
