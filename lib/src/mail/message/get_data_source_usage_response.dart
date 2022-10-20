// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/data_source_usage.dart';

class GetDataSourceUsageResponse extends SoapResponse {
  /// Data source usage data
  final List<DataSourceUsage> usages;

  final int? dataSourceQuota;

  final int? totalQuota;

  GetDataSourceUsageResponse({this.usages = const [], this.dataSourceQuota = 0, this.totalQuota = 0});

  factory GetDataSourceUsageResponse.fromJson(Map<String, dynamic> json) => GetDataSourceUsageResponse(
      usages: (json['dataSourceUsage'] is Iterable)
          ? List.from(
              (json['dataSourceUsage'] as Iterable).map<DataSourceUsage>((usage) => DataSourceUsage.fromJson(usage)))
          : [],
      dataSourceQuota: json['dsQuota'] ?? 0,
      totalQuota: json['dsTotalQuota'] ?? 0);
}
