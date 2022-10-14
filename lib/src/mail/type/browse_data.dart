// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class BrowseData {
  /// Set for domains. Indicates whether or not the domain was from the "From", "To", or "Cc" header.
  /// Valid flags are always one of: "f", "t", "ft", "c", "fc", "tc", "ftc"
  final String browseDomainHeader;

  /// Frequency count
  final int frequency;

  /// Browse data.
  final String? data;

  BrowseData(this.browseDomainHeader, this.frequency, {this.data});

  factory BrowseData.fromJson(Map<String, dynamic> json) =>
      BrowseData(json['h'] ?? '', json['freq'] ?? 0, data: json['_content']);

  Map<String, dynamic> toJson() => {
        'h': browseDomainHeader,
        'freq': frequency,
        if (data != null) '_content': data,
      };
}
