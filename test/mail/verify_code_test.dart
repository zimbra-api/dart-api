import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/verify_code_envelope.dart';
import 'package:zimbra_api/src/mail/message/verify_code_request.dart';
import 'package:zimbra_api/src/mail/message/verify_code_response.dart';

void main() {
  final faker = Faker();

  group('Verify code tests', (() {
    test('Verify code request', (() {
      final address = faker.internet.email();
      final verificationCode = faker.lorem.word();

      final request = VerifyCodeRequest(address, verificationCode);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'VerifyCodeRequest': {
            '_jsns': 'urn:zimbraMail',
            'a': address,
            'code': verificationCode,
          }
        },
      });
    }));

    test('Verify code response', (() {
      final success = faker.randomGenerator.boolean();
      final data = {
        'Body': {
          'VerifyCodeResponse': {
            '_jsns': 'urn:zimbraMail',
            'success': success,
          }
        }
      };
      final envelope = VerifyCodeEnvelope.fromMap(data);
      final response = envelope.body.response as VerifyCodeResponse;
      expect(response.success, success);
    }));
  }));
}
