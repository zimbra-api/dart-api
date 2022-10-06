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
      {this.imapDataSources = const <AccountImapDataSource>[],
      this.pop3DataSources = const <AccountPop3DataSource>[],
      this.caldavDataSources = const <AccountCaldavDataSource>[],
      this.yabDataSources = const <AccountYabDataSource>[],
      this.rssDataSources = const <AccountRssDataSource>[],
      this.galDataSources = const <AccountGalDataSource>[],
      this.calDataSources = const <AccountCalDataSource>[],
      this.unknownDataSources = const <AccountUnknownDataSource>[]});

  factory AccountDataSources.fromJson(Map<String, dynamic> json) {
    final dataSources = AccountDataSources();

    if (json['imap'] != null && json['imap'] is Iterable) {
      final imapDataSources = json['imap'] as Iterable;
      for (final imap in imapDataSources) {
        dataSources.imapDataSources.add(AccountImapDataSource.fromJson(imap));
      }
    }

    if (json['pop3'] != null && json['pop3'] is Iterable) {
      final pop3DataSources = json['pop3'] as Iterable;
      for (final pop3 in pop3DataSources) {
        dataSources.pop3DataSources.add(AccountPop3DataSource.fromJson(pop3));
      }
    }

    if (json['caldav'] != null && json['caldav'] is Iterable) {
      final caldavDataSources = json['caldav'] as Iterable;
      for (final caldav in caldavDataSources) {
        dataSources.caldavDataSources.add(AccountCaldavDataSource.fromJson(caldav));
      }
    }

    if (json['yab'] != null && json['yab'] is Iterable) {
      final yabDataSources = json['yab'] as Iterable;
      for (final yab in yabDataSources) {
        dataSources.yabDataSources.add(AccountYabDataSource.fromJson(yab));
      }
    }

    if (json['rss'] != null && json['rss'] is Iterable) {
      final rssDataSources = json['rss'] as Iterable;
      for (final rss in rssDataSources) {
        dataSources.rssDataSources.add(AccountRssDataSource.fromJson(rss));
      }
    }

    if (json['gal'] != null && json['gal'] is Iterable) {
      final galDataSources = json['gal'] as Iterable;
      for (final gal in galDataSources) {
        dataSources.galDataSources.add(AccountGalDataSource.fromJson(gal));
      }
    }

    if (json['cal'] != null && json['cal'] is Iterable) {
      final calDataSources = json['cal'] as Iterable;
      for (final cal in calDataSources) {
        dataSources.calDataSources.add(AccountCalDataSource.fromJson(cal));
      }
    }

    if (json['unknown'] != null && json['unknown'] is Iterable) {
      final unknownDataSources = json['unknown'] as Iterable;
      for (final unknown in unknownDataSources) {
        dataSources.unknownDataSources.add(AccountUnknownDataSource.fromJson(unknown));
      }
    }

    return dataSources;
  }

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
