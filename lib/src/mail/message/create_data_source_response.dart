// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/cal_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/caldav_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/gal_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/imap_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/pop3_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/rss_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/unknown_data_source_id.dart';
import 'package:zimbra_api/src/mail/type/yab_data_source_id.dart';

class CreateDataSourceResponse extends SoapResponse {
  /// Imap data source
  final ImapDataSourceId? imapDataSource;

  /// Pop3 data source
  final Pop3DataSourceId? pop3DataSource;

  /// Caldav data source
  final CaldavDataSourceId? caldavDataSource;

  /// Yab data source
  final YabDataSourceId? yabDataSource;

  /// Rss data source
  final RssDataSourceId? rssDataSource;

  /// Gal data source
  final GalDataSourceId? galDataSource;

  /// Cal data source
  final CalDataSourceId? calDataSource;

  /// Unknown data source
  final UnknownDataSourceId? unknownDataSource;

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
        imapDataSource: json['imap'] is Map ? ImapDataSourceId.fromJson(json['imap']) : null,
        pop3DataSource: json['pop3'] is Map ? Pop3DataSourceId.fromJson(json['pop3']) : null,
        caldavDataSource: json['caldav'] is Map ? CaldavDataSourceId.fromJson(json['caldav']) : null,
        yabDataSource: json['yab'] is Map ? YabDataSourceId.fromJson(json['yab']) : null,
        rssDataSource: json['rss'] is Map ? RssDataSourceId.fromJson(json['rss']) : null,
        galDataSource: json['gal'] is Map ? GalDataSourceId.fromJson(json['gal']) : null,
        calDataSource: json['cal'] is Map ? CalDataSourceId.fromJson(json['cal']) : null,
        unknownDataSource: json['unknown'] is Map ? UnknownDataSourceId.fromJson(json['unknown']) : null,
      );
}
