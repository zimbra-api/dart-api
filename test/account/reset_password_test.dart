import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/reset_password_envelope.dart';
import 'package:zimbra_api/src/account/message/reset_password_request.dart';
import 'package:zimbra_api/src/account/message/reset_password_response.dart';

void main() {
  final faker = Faker();

  group('Reset password tests', (() {
    test('Reset password request', (() {
      final password = faker.internet.password();
      final request = ResetPasswordRequest(password);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ResetPasswordRequest': {
            '_jsns': 'urn:zimbraAccount',
            'password': {'_content': password},
          }
        },
      });
    }));

    test('Reset password response', (() {
      final data = {
        'Body': {
          'ResetPasswordResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ResetPasswordEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<ResetPasswordResponse>());
    }));
  }));
}
