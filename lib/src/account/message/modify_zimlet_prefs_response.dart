// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ModifyZimletPrefsResponse extends SoapResponse {
  final List<String> zimlets;

  ModifyZimletPrefsResponse({this.zimlets = const <String>[]});

  factory ModifyZimletPrefsResponse.fromJson(Map<String, dynamic> json) {
    final response = ModifyZimletPrefsResponse();

    if (json['zimlet'] != null && json['zimlet'] is Iterable) {
      final zimlets = json['zimlet'] as Iterable;
      for (final zimlet in zimlets) {
        response.zimlets.add(zimlet['_content']);
      }
    }

    return response;
  }
}
