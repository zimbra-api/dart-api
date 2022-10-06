// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class CalendarAttach {
  /// URI
  final String? uri;

  /// Content Type for binaryB64Data
  final String? contentType;

  /// Base64 encoded binary alarrm attach data
  final String? binaryB64Data;

  CalendarAttach({this.uri, this.contentType, this.binaryB64Data});
  factory CalendarAttach.fromJson(Map<String, dynamic> json) =>
      CalendarAttach(uri: json['uri'], contentType: json['ct'], binaryB64Data: json['_content']);

  Map<String, dynamic> toJson() => {
        if (uri != null) 'uri': uri,
        if (contentType != null) 'ct': contentType,
        if (binaryB64Data != null) '_content': binaryB64Data,
      };
}
