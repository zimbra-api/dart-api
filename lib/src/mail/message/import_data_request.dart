// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/data_source_name_or_id.dart';
import 'import_data_body.dart';
import 'import_data_envelope.dart';

/// Triggers the specified data sources to kick off their import processes.
/// Data import runs asynchronously, so the response immediately returns.
/// Status of an import can be queried via the <GetImportStatusRequest> message.
/// If the server receives an <ImportDataRequest> while an import is already running for a given data source,
/// the second request is ignored.
class ImportDataRequest extends SoapRequest {
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

  ImportDataRequest(
      {this.imapDataSources = const [],
      this.pop3DataSources = const [],
      this.caldavDataSources = const [],
      this.yabDataSources = const [],
      this.rssDataSources = const [],
      this.galDataSources = const [],
      this.calDataSources = const [],
      this.unknownDataSources = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ImportDataEnvelope(ImportDataBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (imapDataSources.isNotEmpty) 'imap': imapDataSources.map((imap) => imap.toMap()).toList(growable: false),
        if (pop3DataSources.isNotEmpty) 'pop3': pop3DataSources.map((pop3) => pop3.toMap()).toList(growable: false),
        if (caldavDataSources.isNotEmpty)
          'caldav': caldavDataSources.map((caldav) => caldav.toMap()).toList(growable: false),
        if (yabDataSources.isNotEmpty) 'yab': yabDataSources.map((yab) => yab.toMap()).toList(growable: false),
        if (rssDataSources.isNotEmpty) 'rss': rssDataSources.map((rss) => rss.toMap()).toList(growable: false),
        if (galDataSources.isNotEmpty) 'gal': galDataSources.map((gal) => gal.toMap()).toList(growable: false),
        if (calDataSources.isNotEmpty) 'cal': calDataSources.map((cal) => cal.toMap()).toList(growable: false),
        if (unknownDataSources.isNotEmpty)
          'unknown': unknownDataSources.map((unknown) => unknown.toMap()).toList(growable: false),
      };
}
