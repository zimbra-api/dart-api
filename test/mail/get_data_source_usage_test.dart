import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_data_source_usage_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_data_source_usage_request.dart';

void main() {
  final faker = Faker();

  group('Get data source usage tests', (() {
    test('Get data source usage request', (() {
      final request = GetDataSourceUsageRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetDataSourceUsageRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get data source usage response', (() {
      final id = faker.guid.guid();
      final usage = faker.randomGenerator.integer(100);
      final dataSourceQuota = faker.randomGenerator.integer(100);
      final totalQuota = faker.randomGenerator.integer(100);

      final data = {
        'Body': {
          'GetDataSourceUsageResponse': {
            '_jsns': 'urn:zimbraMail',
            'dsQuota': dataSourceQuota,
            'dsTotalQuota': totalQuota,
            'dataSourceUsage': [
              {
                'id': id,
                'usage': usage,
              }
            ],
          }
        }
      };
      final envelope = GetDataSourceUsageEnvelope.fromMap(data);
      final response = envelope.getDataSourceUsageBody.getDataSourceUsageResponse!;

      expect(response.dataSourceQuota, dataSourceQuota);
      expect(response.totalQuota, totalQuota);

      final dsUsage = response.usages.first;
      expect(dsUsage.id, id);
      expect(dsUsage.usage, usage);
    }));
  }));
}
