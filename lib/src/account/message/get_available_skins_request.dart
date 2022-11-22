// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'get_available_skins_body.dart';
import 'get_available_skins_envelope.dart';

/// Get the intersection of installed skins on the server and the list specified in the zimbraAvailableSkin on an account (or its CoS).
/// If none is set in zimbraAvailableSkin, get the entire list of installed skins.
/// The installed skin list is obtained by a directory scan of the designated location of skins on a server.
class GetAvailableSkinsRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetAvailableSkinsEnvelope(GetAvailableSkinsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
      };
}
