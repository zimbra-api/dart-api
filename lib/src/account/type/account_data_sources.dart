// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'account_cal_data_source.dart';
import 'account_caldav_data_source.dart';
import 'account_gal_data_source.dart';
import 'account_imap_data_source.dart';
import 'account_pop3_data_source.dart';
import 'account_rss_data_source.dart';
import 'account_unknown_data_source.dart';
import 'account_yab_data_source.dart';

class AccountDataSources {
  final List<AccountImapDataSource> imapDataSources;

  final List<AccountPop3DataSource> pop3DataSources;

  final List<AccountCaldavDataSource> caldavDataSources;

  final List<AccountYabDataSource> yabDataSources;

  final List<AccountRssDataSource> rssDataSources;

  final List<AccountGalDataSource> galDataSources;

  final List<AccountCalDataSource> calDataSources;

  final List<AccountUnknownDataSource> unknownDataSources;

  AccountDataSources(
      {this.imapDataSources = const [],
      this.pop3DataSources = const [],
      this.caldavDataSources = const [],
      this.yabDataSources = const [],
      this.rssDataSources = const [],
      this.galDataSources = const [],
      this.calDataSources = const [],
      this.unknownDataSources = const []});

  factory AccountDataSources.fromJson(Map<String, dynamic> json) => AccountDataSources(
        imapDataSources: (json['imap'] is Iterable)
            ? List.from(
                (json['imap'] as Iterable).map<AccountImapDataSource>((imap) => AccountImapDataSource.fromJson(imap)))
            : [],
        pop3DataSources: (json['pop3'] is Iterable)
            ? List.from(
                (json['pop3'] as Iterable).map<AccountPop3DataSource>((pop3) => AccountPop3DataSource.fromJson(pop3)))
            : [],
        caldavDataSources: (json['caldav'] is Iterable)
            ? List.from((json['caldav'] as Iterable)
                .map<AccountCaldavDataSource>((caldav) => AccountCaldavDataSource.fromJson(caldav)))
            : [],
        yabDataSources: (json['yab'] is Iterable)
            ? List.from(
                (json['yab'] as Iterable).map<AccountYabDataSource>((yab) => AccountYabDataSource.fromJson(yab)))
            : [],
        rssDataSources: (json['rss'] is Iterable)
            ? List.from(
                (json['rss'] as Iterable).map<AccountRssDataSource>((rss) => AccountRssDataSource.fromJson(rss)))
            : [],
        galDataSources: (json['gal'] is Iterable)
            ? List.from(
                (json['gal'] as Iterable).map<AccountGalDataSource>((gal) => AccountGalDataSource.fromJson(gal)))
            : [],
        calDataSources: (json['cal'] is Iterable)
            ? List.from(
                (json['cal'] as Iterable).map<AccountCalDataSource>((cal) => AccountCalDataSource.fromJson(cal)))
            : [],
        unknownDataSources: (json['unknown'] is Iterable)
            ? List.from((json['unknown'] as Iterable)
                .map<AccountUnknownDataSource>((unknown) => AccountUnknownDataSource.fromJson(unknown)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        if (imapDataSources.isNotEmpty) 'imap': imapDataSources.map((imap) => imap.toJson()),
        if (pop3DataSources.isNotEmpty) 'pop3': pop3DataSources.map((pop3) => pop3.toJson()),
        if (caldavDataSources.isNotEmpty) 'caldav': caldavDataSources.map((caldav) => caldav.toJson()),
        if (yabDataSources.isNotEmpty) 'yab': yabDataSources.map((yab) => yab.toJson()),
        if (rssDataSources.isNotEmpty) 'rss': rssDataSources.map((rss) => rss.toJson()),
        if (galDataSources.isNotEmpty) 'gal': galDataSources.map((gal) => gal.toJson()),
        if (calDataSources.isNotEmpty) 'cal': calDataSources.map((cal) => cal.toJson()),
        if (unknownDataSources.isNotEmpty) 'unknown': unknownDataSources.map((unknown) => unknown.toJson()),
      };
}
