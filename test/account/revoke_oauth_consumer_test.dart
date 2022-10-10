import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/revoke_oauth_consumer_envelope.dart';
import 'package:zimbra_api/src/account/message/revoke_oauth_consumer_request.dart';
import 'package:zimbra_api/src/account/message/revoke_oauth_consumer_response.dart';

void main() {
  final faker = Faker();

  group('Revoke OAuth consumer tests', (() {
    test('Revoke OAuth consumer request', (() {
      final accessToken = faker.lorem.word();
      final request = RevokeOAuthConsumerRequest(accessToken);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'RevokeOAuthConsumerRequest': {
            '_jsns': 'urn:zimbraAccount',
            'accessToken': accessToken,
          }
        },
      });
    }));

    test('Revoke OAuth consumer response', (() {
      final json = {
        'Body': {
          'RevokeOAuthConsumerResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = RevokeOAuthConsumerEnvelope.fromJson(json);
      expect(envelope.revokeOAuthConsumerBody.revokeOAuthConsumerResponse, isNotNull);
      expect(envelope.revokeOAuthConsumerBody.revokeOAuthConsumerResponse, isA<RevokeOAuthConsumerResponse>());
    }));
  }));
}
