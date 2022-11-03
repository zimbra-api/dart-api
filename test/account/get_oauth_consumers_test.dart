import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_oauth_consumers_envelope.dart';
import 'package:zimbra_api/src/account/message/get_oauth_consumers_request.dart';
import 'package:zimbra_api/src/account/message/get_oauth_consumers_response.dart';

void main() {
  final faker = Faker();

  group('Get OAuth consumers tests', (() {
    test('Get OAuth consumers request', (() {
      final request = GetOAuthConsumersRequest();

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetOAuthConsumersRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get OAuth consumers response', (() {
      final accessToken = faker.lorem.word();
      final approvedOn = faker.lorem.word();
      final applicationName = faker.lorem.word();
      final device = faker.lorem.word();

      final data = {
        'Body': {
          'GetOAuthConsumersResponse': {
            '_jsns': 'urn:zimbraAccount',
            'OAuthConsumer': [
              {
                'accessToken': accessToken,
                'approvedOn': approvedOn,
                'appName': applicationName,
                'device': device,
              }
            ],
          }
        }
      };
      final envelope = GetOAuthConsumersEnvelope.fromMap(data);
      final response = envelope.body.response as GetOAuthConsumersResponse;
      final consumer = response.consumers.first;

      expect(consumer.accessToken, accessToken);
      expect(consumer.approvedOn, approvedOn);
      expect(consumer.applicationName, applicationName);
      expect(consumer.device, device);
    }));
  }));
}
