// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/contact_info.dart';

class ModifyContactResponse extends SoapResponse {
  /// Information about modified contact
  final ContactInfo? contact;

  ModifyContactResponse({this.contact});

  factory ModifyContactResponse.fromMap(Map<String, dynamic> data) =>
      ModifyContactResponse(contact: data['cn'] is Map ? ContactInfo.fromMap(data['cn']) : null);
}
