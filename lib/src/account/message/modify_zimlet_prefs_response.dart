// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class ModifyZimletPrefsResponse extends SoapResponse {
  final List<String> zimlets;

  ModifyZimletPrefsResponse({this.zimlets = const []});

  factory ModifyZimletPrefsResponse.fromMap(Map<String, dynamic> data) => ModifyZimletPrefsResponse(
      zimlets: (data['zimlet'] is Iterable)
          ? List.from((data['zimlet'] as Iterable).map<String>((zimlet) => zimlet['_content']))
          : []);
}
