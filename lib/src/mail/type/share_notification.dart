// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'notification.dart';

class ShareNotification extends Notification {
  ShareNotification({super.truncatedContent, super.content});

  factory ShareNotification.fromMap(Map<String, dynamic> data) =>
      ShareNotification(truncatedContent: data['truncated'], content: data['content']);
}
