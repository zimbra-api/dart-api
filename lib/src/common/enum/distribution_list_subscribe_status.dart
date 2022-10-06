// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum DistributionListSubscribeStatus {
  subscribed,
  unsubscribed,
  awaitingApproval;

  String get name {
    switch (this) {
      case DistributionListSubscribeStatus.subscribed:
        return 'subscribed';
      case DistributionListSubscribeStatus.unsubscribed:
        return 'unsubscribed';
      case DistributionListSubscribeStatus.awaitingApproval:
        return 'awaiting_approval';
    }
  }
}
