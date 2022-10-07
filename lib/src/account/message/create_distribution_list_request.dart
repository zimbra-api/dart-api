// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'create_distribution_list_body.dart';
import 'create_distribution_list_envelope.dart';

/// Create a Distribution List
/// Notes: authed account must have the privilege to create dist lists in the domain
class CreateDistributionListRequest extends SoapRequest {
  /// Name for distribution list
  final String name;

  // If true then create a dynamic distribution list
  final bool? isDynamic;

  /// Key value pairs
  final List<KeyValuePair> keyValuePairs;

  CreateDistributionListRequest(this.name, {this.isDynamic, this.keyValuePairs = const <KeyValuePair>[]});

  @override
  SoapEnvelope getEnvelope() => CreateDistributionListEnvelope(CreateDistributionListBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'name': name,
        if (isDynamic != null) 'dynamic': isDynamic,
        if (keyValuePairs.isNotEmpty) 'a': keyValuePairs.map((a) => a.toJson()),
      };
}
