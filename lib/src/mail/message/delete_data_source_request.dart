// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/data_source_name_or_id.dart';

import 'delete_data_source_body.dart';
import 'delete_data_source_envelope.dart';

/// Deletes the given data sources.
/// The name or id of each data source must be specified.
class DeleteDataSourceRequest extends SoapRequest {
  /// Imap data sources
  final List<DataSourceNameOrId> imapDataSources;

  /// Pop3 data sources
  final List<DataSourceNameOrId> pop3DataSources;

  /// Caldav data sources
  final List<DataSourceNameOrId> caldavDataSources;

  /// Yab data sources
  final List<DataSourceNameOrId> yabDataSources;

  /// Rss data sources
  final List<DataSourceNameOrId> rssDataSources;

  /// Gal data sources
  final List<DataSourceNameOrId> galDataSources;

  /// Cal data sources
  final List<DataSourceNameOrId> calDataSources;

  /// Unknown data sources
  final List<DataSourceNameOrId> unknownDataSources;

  DeleteDataSourceRequest(
      {this.imapDataSources = const [],
      this.pop3DataSources = const [],
      this.caldavDataSources = const [],
      this.yabDataSources = const [],
      this.rssDataSources = const [],
      this.galDataSources = const [],
      this.calDataSources = const [],
      this.unknownDataSources = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DeleteDataSourceEnvelope(DeleteDataSourceBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (imapDataSources.isNotEmpty) 'imap': imapDataSources.map((imap) => imap.toMap()).toList(),
        if (pop3DataSources.isNotEmpty) 'pop3': pop3DataSources.map((pop3) => pop3.toMap()).toList(),
        if (caldavDataSources.isNotEmpty) 'caldav': caldavDataSources.map((caldav) => caldav.toMap()).toList(),
        if (yabDataSources.isNotEmpty) 'yab': yabDataSources.map((yab) => yab.toMap()).toList(),
        if (rssDataSources.isNotEmpty) 'rss': rssDataSources.map((rss) => rss.toMap()).toList(),
        if (galDataSources.isNotEmpty) 'gal': galDataSources.map((gal) => gal.toMap()).toList(),
        if (calDataSources.isNotEmpty) 'cal': calDataSources.map((cal) => cal.toMap()).toList(),
        if (unknownDataSources.isNotEmpty) 'unknown': unknownDataSources.map((imap) => imap.toMap()).toList(),
      };
}
