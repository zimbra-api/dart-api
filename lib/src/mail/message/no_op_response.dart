// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class NoOpResponse extends SoapResponse {
  /// Set if wait was disallowed
  final bool? waitDisallowed;

  NoOpResponse({this.waitDisallowed});

  factory NoOpResponse.fromMap(Map<String, dynamic> data) => NoOpResponse(
        waitDisallowed: data['waitDisallowed'],
      );
}
