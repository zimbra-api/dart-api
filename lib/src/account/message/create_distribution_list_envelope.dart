// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_distribution_list_body.dart';

class CreateDistributionListEnvelope extends SoapEnvelope {
  CreateDistributionListEnvelope(CreateDistributionListBody body, {super.header}) : super(body);

  factory CreateDistributionListEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateDistributionListEnvelope(CreateDistributionListBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateDistributionListBody get createDistributionListBody => body as CreateDistributionListBody;
}
