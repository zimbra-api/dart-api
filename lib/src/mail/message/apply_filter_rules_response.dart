// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/ids_attr.dart';

class ApplyFilterRulesResponse extends SoapResponse {
  final IdsAttr? msgIds;

  ApplyFilterRulesResponse({this.msgIds});

  factory ApplyFilterRulesResponse.fromJson(Map<String, dynamic> json) =>
      ApplyFilterRulesResponse(msgIds: (json['m'] is Map) ? IdsAttr.fromJson(json['m']) : null);
}