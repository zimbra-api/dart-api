// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DiscoverRightsEmail {
  /// Email address
  final String addr;

  DiscoverRightsEmail(this.addr);

  factory DiscoverRightsEmail.fromJson(Map<String, dynamic> json) => DiscoverRightsEmail(json['addr'] ?? '');

  Map<String, dynamic> toJson() => {
        'addr': addr,
      };
}
