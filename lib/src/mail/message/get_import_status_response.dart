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

  factory GetImportStatusResponse.fromJson(Map<String, dynamic> json) => GetImportStatusResponse(
      imapStatuses: (json['imap'] is Iterable)
          ? List.from((json['imap'] as Iterable).map<ImportStatusInfo>((imap) => ImportStatusInfo.fromJson(imap)))
          : [],
      pop3Statuses: (json['pop3'] is Iterable)
          ? List.from((json['pop3'] as Iterable).map<ImportStatusInfo>((pop3) => ImportStatusInfo.fromJson(pop3)))
          : [],
      caldavStatuses: (json['caldav'] is Iterable)
          ? List.from((json['caldav'] as Iterable).map<ImportStatusInfo>((caldav) => ImportStatusInfo.fromJson(caldav)))
          : [],
      yabStatuses: (json['yab'] is Iterable)
          ? List.from((json['yab'] as Iterable).map<ImportStatusInfo>((yab) => ImportStatusInfo.fromJson(yab)))
          : [],
      rssStatuses: (json['rss'] is Iterable)
          ? List.from((json['rss'] as Iterable).map<ImportStatusInfo>((rss) => ImportStatusInfo.fromJson(rss)))
          : [],
      galStatuses: (json['gal'] is Iterable)
          ? List.from((json['gal'] as Iterable).map<ImportStatusInfo>((gal) => ImportStatusInfo.fromJson(gal)))
          : [],
      calStatuses: (json['cal'] is Iterable)
          ? List.from((json['cal'] as Iterable).map<ImportStatusInfo>((cal) => ImportStatusInfo.fromJson(cal)))
          : [],
      unknownStatuses: (json['unknown'] is Iterable)
          ? List.from(
              (json['unknown'] as Iterable).map<ImportStatusInfo>((unknown) => ImportStatusInfo.fromJson(unknown)))
          : []);
}
