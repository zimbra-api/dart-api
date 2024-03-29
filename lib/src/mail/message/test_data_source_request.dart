// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/mail_cal_data_source.dart';
import '../type/mail_caldav_data_source.dart';
import '../type/mail_gal_data_source.dart';
import '../type/mail_imap_data_source.dart';
import '../type/mail_pop3_data_source.dart';
import '../type/mail_rss_data_source.dart';
import '../type/mail_unknown_data_source.dart';
import '../type/mail_yab_data_source.dart';
import 'test_data_source_body.dart';
import 'test_data_source_envelope.dart';

/// Tests the connection to the specified data source.
/// Does not modify the data source or import data.
/// If the id is specified, uses an existing data source.
/// Any values specified in the request are used in the test instead of the saved values.
class TestDataSourceRequest extends SoapRequest {
  /// Imap data source
  final MailImapDataSource? imapDataSource;

  /// Pop3 data source
  final MailPop3DataSource? pop3DataSource;

  /// Caldav data source
  final MailCaldavDataSource? caldavDataSource;

  /// Yab data source
  final MailYabDataSource? yabDataSource;

  /// Rss data source
  final MailRssDataSource? rssDataSource;

  /// Gal data source
  final MailGalDataSource? galDataSource;

  /// Cal data source
  final MailCalDataSource? calDataSource;

  /// Unknown data source
  final MailUnknownDataSource? unknownDataSource;

  TestDataSourceRequest({
    this.imapDataSource,
    this.pop3DataSource,
    this.caldavDataSource,
    this.yabDataSource,
    this.rssDataSource,
    this.galDataSource,
    this.calDataSource,
    this.unknownDataSource,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => TestDataSourceEnvelope(
        TestDataSourceBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (imapDataSource != null) 'imap': imapDataSource!.toMap(),
        if (pop3DataSource != null) 'pop3': pop3DataSource!.toMap(),
        if (caldavDataSource != null) 'caldav': caldavDataSource!.toMap(),
        if (yabDataSource != null) 'yab': yabDataSource!.toMap(),
        if (rssDataSource != null) 'rss': rssDataSource!.toMap(),
        if (galDataSource != null) 'gal': galDataSource!.toMap(),
        if (calDataSource != null) 'cal': calDataSource!.toMap(),
        if (unknownDataSource != null) 'unknown': unknownDataSource!.toMap(),
      };
}
