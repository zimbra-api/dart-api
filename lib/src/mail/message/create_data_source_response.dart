// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/data_source_id.dart';

class CreateDataSourceResponse extends SoapResponse {
  /// Imap data source
  final DataSourceId? imapDataSource;

  /// Pop3 data source
  final DataSourceId? pop3DataSource;

  /// Caldav data source
  final DataSourceId? caldavDataSource;

  /// Yab data source
  final DataSourceId? yabDataSource;

  /// Rss data source
  final DataSourceId? rssDataSource;

  /// Gal data source
  final DataSourceId? galDataSource;

  /// Cal data source
  final DataSourceId? calDataSource;

  /// Unknown data source
  final DataSourceId? unknownDataSource;

  CreateDataSourceResponse(
      {this.imapDataSource,
      this.pop3DataSource,
      this.caldavDataSource,
      this.yabDataSource,
      this.rssDataSource,
      this.galDataSource,
      this.calDataSource,
      this.unknownDataSource});

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) => CreateDataSourceResponse(
      imapDataSource: json['imap'] is Map ? DataSourceId.fromJson(json['imap']) : null,
      pop3DataSource: json['pop3'] is Map ? DataSourceId.fromJson(json['pop3']) : null,
      caldavDataSource: json['caldav'] is Map ? DataSourceId.fromJson(json['caldav']) : null,
      yabDataSource: json['yab'] is Map ? DataSourceId.fromJson(json['yab']) : null,
      rssDataSource: json['rss'] is Map ? DataSourceId.fromJson(json['rss']) : null,
      galDataSource: json['gal'] is Map ? DataSourceId.fromJson(json['gal']) : null,
      calDataSource: json['cal'] is Map ? DataSourceId.fromJson(json['cal']) : null,
      unknownDataSource: json['unknown'] is Map ? DataSourceId.fromJson(json['unknown']) : null);
}
