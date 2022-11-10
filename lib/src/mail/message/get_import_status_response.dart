// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/import_status_info.dart';

class GetImportStatusResponse extends SoapResponse {
  /// Imap statuses
  final List<ImportStatusInfo> imapStatuses;

  /// Pop3 statuses
  final List<ImportStatusInfo> pop3Statuses;

  /// Caldav statuses
  final List<ImportStatusInfo> caldavStatuses;

  /// Yab statuses
  final List<ImportStatusInfo> yabStatuses;

  /// Rss statuses
  final List<ImportStatusInfo> rssStatuses;

  /// Gal statuses
  final List<ImportStatusInfo> galStatuses;

  /// Cal statuses
  final List<ImportStatusInfo> calStatuses;

  /// Unknown statuses
  final List<ImportStatusInfo> unknownStatuses;

  GetImportStatusResponse(
      {this.imapStatuses = const [],
      this.pop3Statuses = const [],
      this.caldavStatuses = const [],
      this.yabStatuses = const [],
      this.rssStatuses = const [],
      this.galStatuses = const [],
      this.calStatuses = const [],
      this.unknownStatuses = const []});

  factory GetImportStatusResponse.fromMap(Map<String, dynamic> data) => GetImportStatusResponse(
      imapStatuses: (data['imap'] is Iterable)
          ? (data['imap'] as Iterable)
              .map<ImportStatusInfo>((imap) => ImportStatusInfo.fromMap(imap))
              .toList(growable: false)
          : const [],
      pop3Statuses: (data['pop3'] is Iterable)
          ? (data['pop3'] as Iterable)
              .map<ImportStatusInfo>((pop3) => ImportStatusInfo.fromMap(pop3))
              .toList(growable: false)
          : const [],
      caldavStatuses: (data['caldav'] is Iterable)
          ? (data['caldav'] as Iterable)
              .map<ImportStatusInfo>((caldav) => ImportStatusInfo.fromMap(caldav))
              .toList(growable: false)
          : const [],
      yabStatuses: (data['yab'] is Iterable)
          ? (data['yab'] as Iterable)
              .map<ImportStatusInfo>((yab) => ImportStatusInfo.fromMap(yab))
              .toList(growable: false)
          : const [],
      rssStatuses: (data['rss'] is Iterable)
          ? (data['rss'] as Iterable)
              .map<ImportStatusInfo>((rss) => ImportStatusInfo.fromMap(rss))
              .toList(growable: false)
          : const [],
      galStatuses: (data['gal'] is Iterable)
          ? (data['gal'] as Iterable)
              .map<ImportStatusInfo>((gal) => ImportStatusInfo.fromMap(gal))
              .toList(growable: false)
          : const [],
      calStatuses: (data['cal'] is Iterable)
          ? (data['cal'] as Iterable)
              .map<ImportStatusInfo>((cal) => ImportStatusInfo.fromMap(cal))
              .toList(growable: false)
          : const [],
      unknownStatuses: (data['unknown'] is Iterable)
          ? (data['unknown'] as Iterable)
              .map<ImportStatusInfo>((unknown) => ImportStatusInfo.fromMap(unknown))
              .toList(growable: false)
          : const []);
}
