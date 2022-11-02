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
      imapDataSource: json['imap']?[0] is Map ? DataSourceId.fromJson(json['imap'][0]) : null,
      pop3DataSource: json['pop3']?[0] is Map ? DataSourceId.fromJson(json['pop3'][0]) : null,
      caldavDataSource: json['caldav']?[0] is Map ? DataSourceId.fromJson(json['caldav'][0]) : null,
      yabDataSource: json['yab']?[0] is Map ? DataSourceId.fromJson(json['yab'][0]) : null,
      rssDataSource: json['rss']?[0] is Map ? DataSourceId.fromJson(json['rss'][0]) : null,
      galDataSource: json['gal']?[0] is Map ? DataSourceId.fromJson(json['gal'][0]) : null,
      calDataSource: json['cal']?[0] is Map ? DataSourceId.fromJson(json['cal'][0]) : null,
      unknownDataSource: json['unknown']?[0] is Map ? DataSourceId.fromJson(json['unknown'][0]) : null);
}
