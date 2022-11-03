import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_yahoo_auth_token_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_yahoo_auth_token_request.dart';
import 'package:zimbra_api/src/mail/message/get_yahoo_auth_token_response.dart';

void main() {
  final faker = Faker();

  group('Get Yahoo Auth Token tests', (() {
    test('Get Yahoo Auth Token request', (() {
      final user = faker.internet.userName();
      final password = faker.internet.password();
      final request = GetYahooAuthTokenRequest(user, password);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetYahooAuthTokenRequest': {
            '_jsns': 'urn:zimbraMail',
            'user': user,
            'password': password,
          }
        },
      });
    }));

    test('Get Yahoo Auth Token response', (() {
      final failed = faker.randomGenerator.boolean();
      final data = {
        'Body': {
          'GetYahooAuthTokenResponse': {
            '_jsns': 'urn:zimbraMail',
            'failed': failed,
          }
        }
      };
      final envelope = GetYahooAuthTokenEnvelope.fromMap(data);
      final response = envelope.body.response as GetYahooAuthTokenResponse;
      expect(response.failed, failed);
    }));
  }));
}
