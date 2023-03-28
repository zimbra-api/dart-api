// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DiscoverRightsEmail {
  /// Email address
  final String addr;

  const DiscoverRightsEmail(this.addr);

  factory DiscoverRightsEmail.fromMap(
    Map<String, dynamic> data,
  ) =>
      DiscoverRightsEmail(data['addr'] ?? '');

  Map<String, dynamic> toMap() => {
        'addr': addr,
      };
}
