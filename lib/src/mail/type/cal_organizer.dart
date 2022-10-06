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

  CalOrganizer(
      {this.address,
      this.url,
      this.displayName,
      this.sentBy,
      this.dir,
      this.language,
      this.xParams = const <XParam>[]});

  factory CalOrganizer.fromJson(Map<String, dynamic> json) {
    final or = CalOrganizer(
        address: json['a'],
        url: json['url'],
        displayName: json['d'],
        sentBy: json['sentBy'],
        dir: json['dir'],
        language: json['lang']);

    if (json['xparam'] != null && json['xparam'] is Iterable) {
      final xParams = json['xparam'] as Iterable;
      for (final xparam in xParams) {
        or.xParams.add(XParam.fromJson(xparam));
      }
    }

    return or;
  }

  Map<String, dynamic> toJson() => {
        if (address != null) 'a': address,
        if (url != null) 'url': url,
        if (displayName != null) 'd': displayName,
        if (sentBy != null) 'sentBy': sentBy,
        if (dir != null) 'dir': dir,
        if (language != null) 'lang': language,
        if (xParams.isNotEmpty) 'xparam': xParams.map((xparam) => xparam.toJson()),
      };
}
