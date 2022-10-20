// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/mail_cal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_caldav_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_gal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_imap_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_pop3_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_rss_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_unknown_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_yab_data_source.dart';

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

  factory GetDataSourcesResponse.fromJson(Map<String, dynamic> json) => GetDataSourcesResponse(
        imapDataSources: (json['imap'] is Iterable)
            ? List.from((json['imap'] as Iterable).map<MailImapDataSource>((imap) => MailImapDataSource.fromJson(imap)))
            : [],
        pop3DataSources: (json['pop3'] is Iterable)
            ? List.from((json['pop3'] as Iterable).map<MailPop3DataSource>((pop3) => MailPop3DataSource.fromJson(pop3)))
            : [],
        caldavDataSources: (json['caldav'] is Iterable)
            ? List.from((json['caldav'] as Iterable)
                .map<MailCaldavDataSource>((caldav) => MailCaldavDataSource.fromJson(caldav)))
            : [],
        yabDataSources: (json['yab'] is Iterable)
            ? List.from((json['yab'] as Iterable).map<MailYabDataSource>((yab) => MailYabDataSource.fromJson(yab)))
            : [],
        rssDataSources: (json['rss'] is Iterable)
            ? List.from((json['rss'] as Iterable).map<MailRssDataSource>((rss) => MailRssDataSource.fromJson(rss)))
            : [],
        galDataSources: (json['gal'] is Iterable)
            ? List.from((json['gal'] as Iterable).map<MailGalDataSource>((gal) => MailGalDataSource.fromJson(gal)))
            : [],
        calDataSources: (json['cal'] is Iterable)
            ? List.from((json['cal'] as Iterable).map<MailCalDataSource>((cal) => MailCalDataSource.fromJson(cal)))
            : [],
        unknownDataSources: (json['unknown'] is Iterable)
            ? List.from((json['unknown'] as Iterable)
                .map<MailUnknownDataSource>((unknown) => MailUnknownDataSource.fromJson(unknown)))
            : [],
      );
}
