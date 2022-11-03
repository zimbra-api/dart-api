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

  factory TestDataSourceResponse.fromMap(Map<String, dynamic> data) => TestDataSourceResponse(
      imapDataSources: (data['imap'] is Iterable)
          ? List.from((data['imap'] as Iterable).map<TestDataSource>((imap) => TestDataSource.fromMap(imap)))
          : [],
      pop3DataSources: (data['pop3'] is Iterable)
          ? List.from((data['pop3'] as Iterable).map<TestDataSource>((pop3) => TestDataSource.fromMap(pop3)))
          : [],
      caldavDataSources: (data['caldav'] is Iterable)
          ? List.from((data['caldav'] as Iterable).map<TestDataSource>((caldav) => TestDataSource.fromMap(caldav)))
          : [],
      yabDataSources: (data['yab'] is Iterable)
          ? List.from((data['yab'] as Iterable).map<TestDataSource>((yab) => TestDataSource.fromMap(yab)))
          : [],
      rssDataSources: (data['rss'] is Iterable)
          ? List.from((data['rss'] as Iterable).map<TestDataSource>((rss) => TestDataSource.fromMap(rss)))
          : [],
      galDataSources: (data['gal'] is Iterable)
          ? List.from((data['gal'] as Iterable).map<TestDataSource>((gal) => TestDataSource.fromMap(gal)))
          : [],
      calDataSources: (data['cal'] is Iterable)
          ? List.from((data['cal'] as Iterable).map<TestDataSource>((cal) => TestDataSource.fromMap(cal)))
          : [],
      unknownDataSources: (data['unknown'] is Iterable)
          ? List.from((data['unknown'] as Iterable).map<TestDataSource>((unknown) => TestDataSource.fromMap(unknown)))
          : []);
}
