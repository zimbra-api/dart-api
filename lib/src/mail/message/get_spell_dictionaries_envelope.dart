// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_spell_dictionaries_body.dart';

class GetSpellDictionariesEnvelope extends SoapEnvelope {
  GetSpellDictionariesEnvelope(GetSpellDictionariesBody body, {super.header}) : super(body);

  factory GetSpellDictionariesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetSpellDictionariesEnvelope(GetSpellDictionariesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetSpellDictionariesBody get getSpellDictionariesBody => body as GetSpellDictionariesBody;
}
