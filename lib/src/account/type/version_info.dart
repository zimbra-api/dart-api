// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class VersionInfo {
  /// Full version string
  final String fullVersion;

  /// Release string
  final String? release;

  /// Build date in format: YYYYMMDD-hhmm
  final String? date;

  /// Build host name
  final String? host;

  VersionInfo(this.fullVersion, {this.release, this.date, this.host});

  factory VersionInfo.fromJson(Map<String, dynamic> json) =>
      VersionInfo(json['version'] ?? '', release: json['release'], date: json['buildDate'], host: json['host']);

  Map<String, dynamic> toJson() => {
        'version': fullVersion,
        if (release != null) 'release': release,
        if (date != null) 'buildDate': date,
        if (host != null) 'host': host,
      };
}
