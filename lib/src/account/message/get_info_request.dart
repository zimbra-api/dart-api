// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_info_body.dart';
import 'get_info_envelope.dart';

/// Get information about an account.
/// By default, GetInfo returns all data; to limit the returned data, specify only the sections you want in the "sections" attr.
class GetInfoRequest extends SoapRequest {
  /// Comma separated list of sections to return information about.
  /// Sections are: mbox,prefs,attrs,zimlets,props,idents,sigs,dsrcs,children
  final String? sections;

  /// Comma separated list of rights to return information about.
  final String? rights;

  GetInfoRequest({this.sections, this.rights});

  @override
  SoapEnvelope getEnvelope() => GetInfoEnvelope(GetInfoBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (sections != null) 'sections': sections,
        if (rights != null) 'rights': rights,
      };
}
