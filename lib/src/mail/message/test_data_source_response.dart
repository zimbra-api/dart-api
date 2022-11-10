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
          ? (data['imap'] as Iterable)
              .map<TestDataSource>((imap) => TestDataSource.fromMap(imap))
              .toList(growable: false)
          : const [],
      pop3DataSources: (data['pop3'] is Iterable)
          ? (data['pop3'] as Iterable)
              .map<TestDataSource>((pop3) => TestDataSource.fromMap(pop3))
              .toList(growable: false)
          : const [],
      caldavDataSources: (data['caldav'] is Iterable)
          ? (data['caldav'] as Iterable)
              .map<TestDataSource>((caldav) => TestDataSource.fromMap(caldav))
              .toList(growable: false)
          : const [],
      yabDataSources: (data['yab'] is Iterable)
          ? (data['yab'] as Iterable).map<TestDataSource>((yab) => TestDataSource.fromMap(yab)).toList(growable: false)
          : const [],
      rssDataSources: (data['rss'] is Iterable)
          ? (data['rss'] as Iterable).map<TestDataSource>((rss) => TestDataSource.fromMap(rss)).toList(growable: false)
          : const [],
      galDataSources: (data['gal'] is Iterable)
          ? (data['gal'] as Iterable).map<TestDataSource>((gal) => TestDataSource.fromMap(gal)).toList(growable: false)
          : const [],
      calDataSources: (data['cal'] is Iterable)
          ? (data['cal'] as Iterable).map<TestDataSource>((cal) => TestDataSource.fromMap(cal)).toList(growable: false)
          : const [],
      unknownDataSources: (data['unknown'] is Iterable)
          ? (data['unknown'] as Iterable)
              .map<TestDataSource>((unknown) => TestDataSource.fromMap(unknown))
              .toList(growable: false)
          : const []);
}
