// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/mail_cal_data_source.dart';
import '../type/mail_caldav_data_source.dart';
import '../type/mail_gal_data_source.dart';
import '../type/mail_imap_data_source.dart';
import '../type/mail_pop3_data_source.dart';
import '../type/mail_rss_data_source.dart';
import '../type/mail_unknown_data_source.dart';
import '../type/mail_yab_data_source.dart';

class GetDataSourcesResponse extends SoapResponse {
  /// Imap data sources
  final List<MailImapDataSource> imapDataSources;

  /// Pop3 data sources
  final List<MailPop3DataSource> pop3DataSources;

  /// Caldav data sources
  final List<MailCaldavDataSource> caldavDataSources;

  /// Yab data sources
  final List<MailYabDataSource> yabDataSources;

  /// Rss data sources
  final List<MailRssDataSource> rssDataSources;

  /// Gal data sources
  final List<MailGalDataSource> galDataSources;

  /// Cal data sources
  final List<MailCalDataSource> calDataSources;

  /// Unknown data sources
  final List<MailUnknownDataSource> unknownDataSources;

  GetDataSourcesResponse(
      {this.imapDataSources = const [],
      this.pop3DataSources = const [],
      this.caldavDataSources = const [],
      this.yabDataSources = const [],
      this.rssDataSources = const [],
      this.galDataSources = const [],
      this.calDataSources = const [],
      this.unknownDataSources = const []});

  factory GetDataSourcesResponse.fromMap(Map<String, dynamic> data) => GetDataSourcesResponse(
      imapDataSources: (data['imap'] is Iterable)
          ? (data['imap'] as Iterable)
              .map<MailImapDataSource>((imap) => MailImapDataSource.fromMap(imap))
              .toList(growable: false)
          : const [],
      pop3DataSources: (data['pop3'] is Iterable)
          ? (data['pop3'] as Iterable)
              .map<MailPop3DataSource>((pop3) => MailPop3DataSource.fromMap(pop3))
              .toList(growable: false)
          : const [],
      caldavDataSources: (data['caldav'] is Iterable)
          ? (data['caldav'] as Iterable)
              .map<MailCaldavDataSource>((caldav) => MailCaldavDataSource.fromMap(caldav))
              .toList(growable: false)
          : const [],
      yabDataSources: (data['yab'] is Iterable)
          ? (data['yab'] as Iterable)
              .map<MailYabDataSource>((yab) => MailYabDataSource.fromMap(yab))
              .toList(growable: false)
          : const [],
      rssDataSources: (data['rss'] is Iterable)
          ? (data['rss'] as Iterable)
              .map<MailRssDataSource>((rss) => MailRssDataSource.fromMap(rss))
              .toList(growable: false)
          : const [],
      galDataSources: (data['gal'] is Iterable)
          ? (data['gal'] as Iterable)
              .map<MailGalDataSource>((gal) => MailGalDataSource.fromMap(gal))
              .toList(growable: false)
          : const [],
      calDataSources: (data['cal'] is Iterable)
          ? (data['cal'] as Iterable)
              .map<MailCalDataSource>((cal) => MailCalDataSource.fromMap(cal))
              .toList(growable: false)
          : const [],
      unknownDataSources: (data['unknown'] is Iterable)
          ? (data['unknown'] as Iterable)
              .map<MailUnknownDataSource>((unknown) => MailUnknownDataSource.fromMap(unknown))
              .toList(growable: false)
          : const []);
}
