// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Geo information
class GeoInfo {
  /// Latitude (float value)
  final String? latitude;

  /// Longitude (float value)
  final String? longitude;

  GeoInfo({this.latitude, this.longitude});

  factory GeoInfo.fromJson(Map<String, dynamic> json) => GeoInfo(latitude: json['lat'], longitude: json['lon']);

  Map<String, dynamic> toJson() => {
        if (latitude != null) 'lat': latitude,
        if (longitude != null) 'lon': longitude,
      };
}
