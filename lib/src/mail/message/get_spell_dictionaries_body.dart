// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_spell_dictionaries_request.dart';
import 'get_spell_dictionaries_response.dart';

class GetSpellDictionariesBody extends SoapBody {
  GetSpellDictionariesBody({GetSpellDictionariesRequest? request, GetSpellDictionariesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetSpellDictionariesBody.fromJson(Map<String, dynamic> json) => GetSpellDictionariesBody(
      response: json['GetSpellDictionariesResponse'] != null
          ? GetSpellDictionariesResponse.fromJson(json['GetSpellDictionariesResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetSpellDictionariesRequest? get getSpellDictionariesRequest => request as GetSpellDictionariesRequest?;

  GetSpellDictionariesResponse? get getSpellDictionariesResponse => response as GetSpellDictionariesResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetSpellDictionariesRequest': request!.toJson(),
      };
}
