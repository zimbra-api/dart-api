// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetLastItemIdInMailboxResponse extends SoapResponse {
  /// ID of last item created in mailbox
  final int id;

  GetLastItemIdInMailboxResponse({this.id = 0});

  factory GetLastItemIdInMailboxResponse.fromJson(Map<String, dynamic> json) =>
      GetLastItemIdInMailboxResponse(id: json['id']?['_content'] ?? 0);
}
