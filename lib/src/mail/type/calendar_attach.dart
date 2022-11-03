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
  factory CalendarAttach.fromMap(Map<String, dynamic> data) =>
      CalendarAttach(uri: data['uri'], contentType: data['ct'], binaryB64Data: data['_content']);

  Map<String, dynamic> toMap() => {
        if (uri != null) 'uri': uri,
        if (contentType != null) 'ct': contentType,
        if (binaryB64Data != null) '_content': binaryB64Data,
      };
}
