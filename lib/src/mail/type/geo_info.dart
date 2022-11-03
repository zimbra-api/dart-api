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

  factory GeoInfo.fromMap(Map<String, dynamic> data) => GeoInfo(latitude: data['lat'], longitude: data['lon']);

  Map<String, dynamic> toMap() => {
        if (latitude != null) 'lat': latitude,
        if (longitude != null) 'lon': longitude,
      };
}
