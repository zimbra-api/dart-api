// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'xparam.dart';

/// Calendar organizer
class CalOrganizer {
  /// Email address (without "MAILTO:")
  final String? address;

  /// URL - has same value as email-address.
  final String? url;

  /// Friendly name - "CN" in iCalendar
  final String? displayName;

  /// iCalendar SENT-BY
  final String? sentBy;

  /// iCalendar DIR - Reference to a directory entry associated with the calendar user.
  final String? dir;

  /// iCalendar LANGUAGE - As defined in RFC5646 * (e.g. "en-US")
  final String? language;

  /// Non-standard parameters (XPARAMs)
  final List<XParam> xParams;

  const CalOrganizer({
    this.address,
    this.url,
    this.displayName,
    this.sentBy,
    this.dir,
    this.language,
    this.xParams = const [],
  });

  factory CalOrganizer.fromMap(Map<String, dynamic> data) => CalOrganizer(
        address: data['a'],
        url: data['url'],
        displayName: data['d'],
        sentBy: data['sentBy'],
        dir: data['dir'],
        language: data['lang'],
        xParams: (data['xparam'] is Iterable)
            ? (data['xparam'] as Iterable)
                .map<XParam>(
                  (xparam) => XParam.fromMap(xparam),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (address != null) 'a': address,
        if (url != null) 'url': url,
        if (displayName != null) 'd': displayName,
        if (sentBy != null) 'sentBy': sentBy,
        if (dir != null) 'dir': dir,
        if (language != null) 'lang': language,
        if (xParams.isNotEmpty)
          'xparam': xParams
              .map(
                (xparam) => xparam.toMap(),
              )
              .toList(growable: false),
      };
}
