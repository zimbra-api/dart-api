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

  factory CreateDataSourceResponse.fromMap(Map<String, dynamic> data) => CreateDataSourceResponse(
      imapDataSource: data['imap']?[0] is Map ? DataSourceId.fromMap(data['imap'][0]) : null,
      pop3DataSource: data['pop3']?[0] is Map ? DataSourceId.fromMap(data['pop3'][0]) : null,
      caldavDataSource: data['caldav']?[0] is Map ? DataSourceId.fromMap(data['caldav'][0]) : null,
      yabDataSource: data['yab']?[0] is Map ? DataSourceId.fromMap(data['yab'][0]) : null,
      rssDataSource: data['rss']?[0] is Map ? DataSourceId.fromMap(data['rss'][0]) : null,
      galDataSource: data['gal']?[0] is Map ? DataSourceId.fromMap(data['gal'][0]) : null,
      calDataSource: data['cal']?[0] is Map ? DataSourceId.fromMap(data['cal'][0]) : null,
      unknownDataSource: data['unknown']?[0] is Map ? DataSourceId.fromMap(data['unknown'][0]) : null);
}
