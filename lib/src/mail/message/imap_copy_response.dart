// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/imap_item_info.dart';

class IMAPCopyResponse extends SoapResponse {
  /// New items
  final List<IMAPItemInfo> items;

  IMAPCopyResponse({this.items = const []});

  factory IMAPCopyResponse.fromMap(Map<String, dynamic> data) => IMAPCopyResponse(
      items: (data['item'] is Iterable)
          ? (data['item'] as Iterable).map<IMAPItemInfo>((item) => IMAPItemInfo.fromMap(item)).toList(growable: false)
          : const []);
}
