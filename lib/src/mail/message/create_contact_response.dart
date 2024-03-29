// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/contact_info.dart';

class CreateContactResponse extends SoapResponse {
  /// Details of the contact.
  /// Note that if verbose was not set in the request,
  /// the returned <cn> is just a placeholder containing the new contact ID (i.e. <cn id="{id}"/>)
  final ContactInfo? contact;

  CreateContactResponse({this.contact});

  factory CreateContactResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateContactResponse(
        contact: data['cn'] is Map ? ContactInfo.fromMap(data['cn']) : null,
      );
}
