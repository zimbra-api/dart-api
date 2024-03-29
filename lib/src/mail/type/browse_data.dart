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

  const BrowseData(this.browseDomainHeader, this.frequency, {this.data});

  factory BrowseData.fromMap(Map<String, dynamic> data) => BrowseData(
        data['h'] ?? '',
        int.tryParse(data['freq']?.toString() ?? '') ?? 0,
        data: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        'h': browseDomainHeader,
        'freq': frequency,
        if (data != null) '_content': data,
      };
}
