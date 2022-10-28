// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/test_data_source.dart';

class TestDataSourceResponse extends SoapResponse {
  /// Imap data sources
  final List<TestDataSource> imapDataSources;

  /// Pop3 data sources
  final List<TestDataSource> pop3DataSources;

  /// Caldav data sources
  final List<TestDataSource> caldavDataSources;

  /// Yab data sources
  final List<TestDataSource> yabDataSources;

  /// Rss data sources
  final List<TestDataSource> rssDataSources;

  /// Gal data sources
  final List<TestDataSource> galDataSources;

  /// Cal data sources
  final List<TestDataSource> calDataSources;

  /// Unknown data sources
  final List<TestDataSource> unknownDataSources;

  TestDataSourceResponse(
      {this.imapDataSources = const [],
      this.pop3DataSources = const [],
      this.caldavDataSources = const [],
      this.yabDataSources = const [],
      this.rssDataSources = const [],
      this.galDataSources = const [],
      this.calDataSources = const [],
      this.unknownDataSources = const []});

  factory TestDataSourceResponse.fromJson(Map<String, dynamic> json) => TestDataSourceResponse(
      imapDataSources: (json['imap'] is Iterable)
          ? List.from((json['imap'] as Iterable).map<TestDataSource>((imap) => TestDataSource.fromJson(imap)))
          : [],
      pop3DataSources: (json['pop3'] is Iterable)
          ? List.from((json['pop3'] as Iterable).map<TestDataSource>((pop3) => TestDataSource.fromJson(pop3)))
          : [],
      caldavDataSources: (json['caldav'] is Iterable)
          ? List.from((json['caldav'] as Iterable).map<TestDataSource>((caldav) => TestDataSource.fromJson(caldav)))
          : [],
      yabDataSources: (json['yab'] is Iterable)
          ? List.from((json['yab'] as Iterable).map<TestDataSource>((yab) => TestDataSource.fromJson(yab)))
          : [],
      rssDataSources: (json['rss'] is Iterable)
          ? List.from((json['rss'] as Iterable).map<TestDataSource>((rss) => TestDataSource.fromJson(rss)))
          : [],
      galDataSources: (json['gal'] is Iterable)
          ? List.from((json['gal'] as Iterable).map<TestDataSource>((gal) => TestDataSource.fromJson(gal)))
          : [],
      calDataSources: (json['cal'] is Iterable)
          ? List.from((json['cal'] as Iterable).map<TestDataSource>((cal) => TestDataSource.fromJson(cal)))
          : [],
      unknownDataSources: (json['unknown'] is Iterable)
          ? List.from((json['unknown'] as Iterable).map<TestDataSource>((unknown) => TestDataSource.fromJson(unknown)))
          : []);
}
