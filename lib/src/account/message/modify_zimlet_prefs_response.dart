// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ModifyZimletPrefsResponse extends SoapResponse {
  final List<String> zimlets;

  ModifyZimletPrefsResponse({this.zimlets = const []});

  factory ModifyZimletPrefsResponse.fromJson(Map<String, dynamic> json) {
    final zimlets = <String>[];
    if (json['zimlet'] != null && json['zimlet'] is Iterable) {
      final elements = json['zimlet'] as Iterable;
      for (final zimlet in elements) {
        zimlets.add(zimlet['_content']);
      }
    }

    return ModifyZimletPrefsResponse(zimlets: zimlets);
  }
}
