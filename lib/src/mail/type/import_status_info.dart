// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ImportStatusInfo {
  /// Data source ID
  final String? id;

  /// Whether data is currently being imported from this data source
  final bool? isRunning;

  /// Whether the last import completed successfully.
  /// (not returned if the import has not run yet)
  final bool? success;

  /// If the last import failed, this is the error message that was returned.
  /// (not returned if the import has not run yet)
  final String? error;

  const ImportStatusInfo({
    this.id,
    this.isRunning,
    this.success,
    this.error,
  });

  factory ImportStatusInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      ImportStatusInfo(
        id: data['id'],
        isRunning: data['isRunning'],
        success: data['success'],
        error: data['error'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (isRunning != null) 'isRunning': isRunning,
        if (success != null) 'success': success,
        if (error != null) 'error': error,
      };
}
