// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/prop.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'modify_properties_body.dart';
import 'modify_properties_envelope.dart';

/// Modify properties related to zimlets
class ModifyPropertiesRequest extends SoapRequest {
  /// Property to be modified
  final List<Prop> props;

  ModifyPropertiesRequest({this.props = const <Prop>[]});

  @override
  SoapEnvelope getEnvelope() => ModifyPropertiesEnvelope(ModifyPropertiesBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (props.isNotEmpty) 'prop': props.map((prop) => prop.toJson()),
      };
}
