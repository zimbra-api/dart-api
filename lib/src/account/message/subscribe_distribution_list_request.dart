// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/distribution_list_subscribe_op.dart';
import '../../common/type/distribution_list_selector.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'subscribe_distribution_list_body.dart';
import 'subscribe_distribution_list_envelope.dart';

/// Subscribe to or unsubscribe from a distribution list
class SubscribeDistributionListRequest extends SoapRequest {
  /// Selector for the distribution list
  final DistributionListSelector dl;

  /// The operation to perform.
  final DistributionListSubscribeOp op;

  SubscribeDistributionListRequest(this.dl, {this.op = DistributionListSubscribeOp.subscribe});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SubscribeDistributionListEnvelope(SubscribeDistributionListBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'op': op.name,
        'dl': dl.toMap(),
      };
}
