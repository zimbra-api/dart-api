// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'subscribe_distribution_list_body.dart';

class SubscribeDistributionListEnvelope extends SoapEnvelope {
  SubscribeDistributionListEnvelope(SubscribeDistributionListBody body, {super.header}) : super(body);

  factory SubscribeDistributionListEnvelope.fromJson(Map<String, dynamic> json) =>
      SubscribeDistributionListEnvelope(SubscribeDistributionListBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SubscribeDistributionListBody get subscribeDistributionListBody => body as SubscribeDistributionListBody;
}
