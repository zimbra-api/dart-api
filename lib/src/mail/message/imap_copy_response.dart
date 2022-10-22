// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/imap_item_info.dart';

class IMAPCopyResponse extends SoapResponse {
  /// New items
  final List<IMAPItemInfo> items;

  IMAPCopyResponse({this.items = const []});

  factory IMAPCopyResponse.fromJson(Map<String, dynamic> json) => IMAPCopyResponse(
      items: (json['item'] is Iterable)
          ? List.from((json['item'] as Iterable).map<IMAPItemInfo>((item) => IMAPItemInfo.fromJson(item)))
          : []);
}
