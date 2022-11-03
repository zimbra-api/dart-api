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

  factory AccountDataSources.fromMap(Map<String, dynamic> data) => AccountDataSources(
        imapDataSources: (data['imap'] is Iterable)
            ? List.from(
                (data['imap'] as Iterable).map<AccountImapDataSource>((imap) => AccountImapDataSource.fromMap(imap)))
            : [],
        pop3DataSources: (data['pop3'] is Iterable)
            ? List.from(
                (data['pop3'] as Iterable).map<AccountPop3DataSource>((pop3) => AccountPop3DataSource.fromMap(pop3)))
            : [],
        caldavDataSources: (data['caldav'] is Iterable)
            ? List.from((data['caldav'] as Iterable)
                .map<AccountCaldavDataSource>((caldav) => AccountCaldavDataSource.fromMap(caldav)))
            : [],
        yabDataSources: (data['yab'] is Iterable)
            ? List.from(
                (data['yab'] as Iterable).map<AccountYabDataSource>((yab) => AccountYabDataSource.fromMap(yab)))
            : [],
        rssDataSources: (data['rss'] is Iterable)
            ? List.from(
                (data['rss'] as Iterable).map<AccountRssDataSource>((rss) => AccountRssDataSource.fromMap(rss)))
            : [],
        galDataSources: (data['gal'] is Iterable)
            ? List.from(
                (data['gal'] as Iterable).map<AccountGalDataSource>((gal) => AccountGalDataSource.fromMap(gal)))
            : [],
        calDataSources: (data['cal'] is Iterable)
            ? List.from(
                (data['cal'] as Iterable).map<AccountCalDataSource>((cal) => AccountCalDataSource.fromMap(cal)))
            : [],
        unknownDataSources: (data['unknown'] is Iterable)
            ? List.from((data['unknown'] as Iterable)
                .map<AccountUnknownDataSource>((unknown) => AccountUnknownDataSource.fromMap(unknown)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        if (imapDataSources.isNotEmpty) 'imap': imapDataSources.map((imap) => imap.toMap()),
        if (pop3DataSources.isNotEmpty) 'pop3': pop3DataSources.map((pop3) => pop3.toMap()),
        if (caldavDataSources.isNotEmpty) 'caldav': caldavDataSources.map((caldav) => caldav.toMap()),
        if (yabDataSources.isNotEmpty) 'yab': yabDataSources.map((yab) => yab.toMap()),
        if (rssDataSources.isNotEmpty) 'rss': rssDataSources.map((rss) => rss.toMap()),
        if (galDataSources.isNotEmpty) 'gal': galDataSources.map((gal) => gal.toMap()),
        if (calDataSources.isNotEmpty) 'cal': calDataSources.map((cal) => cal.toMap()),
        if (unknownDataSources.isNotEmpty) 'unknown': unknownDataSources.map((unknown) => unknown.toMap()),
      };
}
