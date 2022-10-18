// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/mail_cal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_caldav_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_gal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_imap_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_pop3_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_rss_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_unknown_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_yab_data_source.dart';

import 'create_data_source_body.dart';
import 'create_data_source_envelope.dart';

/// Creates a data source that imports mail items into the specified folder, for example
/// via the POP3 or IMAP protocols. Only one data source is allowed per request.
class CreateDataSourceRequest extends SoapRequest {
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

  CreateDataSourceRequest(
      {this.imapDataSource,
      this.pop3DataSource,
      this.caldavDataSource,
      this.yabDataSource,
      this.rssDataSource,
      this.galDataSource,
      this.calDataSource,
      this.unknownDataSource});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateDataSourceEnvelope(CreateDataSourceBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (imapDataSource != null) 'imap': imapDataSource!.toJson(),
        if (pop3DataSource != null) 'pop3': pop3DataSource!.toJson(),
        if (caldavDataSource != null) 'caldav': caldavDataSource!.toJson(),
        if (yabDataSource != null) 'yab': yabDataSource!.toJson(),
        if (rssDataSource != null) 'rss': rssDataSource!.toJson(),
        if (galDataSource != null) 'gal': galDataSource!.toJson(),
        if (calDataSource != null) 'cal': calDataSource!.toJson(),
        if (unknownDataSource != null) 'unknown': unknownDataSource!.toJson(),
      };
}