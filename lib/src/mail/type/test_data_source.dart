// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with super source code.

class TestDataSource {
  /// 0 if data source test failed, 1 if test succeeded
  final int success;

  /// error message passed by DatImport::test method of the datasource being tested
  final String? error;

  const TestDataSource(this.success, {this.error});

  factory TestDataSource.fromMap(Map<String, dynamic> data) => TestDataSource(
        int.tryParse(data['success']?.toString() ?? '') ?? 0,
        error: data['error'],
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        if (error != null) 'error': error,
      };
}
