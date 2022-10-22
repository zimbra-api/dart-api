import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_yahoo_cookie_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_yahoo_cookie_request.dart';

void main() {
  final faker = Faker();

  group('Get Yahoo cookie tests', (() {
    test('Get Yahoo cookie request', (() {
      final user = faker.internet.userName();
      final request = GetYahooCookieRequest(user);
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetYahooCookieRequest': {
            '_jsns': 'urn:zimbraMail',
            'user': user,
          }
        },
      });
    }));

    test('Get Yahoo cookie response', (() {
      final error = faker.lorem.word();
      final crumb = faker.lorem.word();
      final y = faker.lorem.word();
      final t = faker.lorem.word();

      final json = {
        'Body': {
          'GetYahooCookieResponse': {
            '_jsns': 'urn:zimbraMail',
            'error': error,
            'crumb': crumb,
            'y': y,
            't': t,
          }
        }
      };
      final envelope = GetYahooCookieEnvelope.fromJson(json);
      final response = envelope.getYahooCookieBody.getYahooCookieResponse!;
      expect(response.error, error);
      expect(response.crumb, crumb);
      expect(response.y, y);
      expect(response.t, t);
    }));
  }));
}
