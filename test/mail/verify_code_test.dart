import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/verify_code_envelope.dart';
import 'package:zimbra_api/src/mail/message/verify_code_request.dart';

void main() {
  final faker = Faker();

  group('Verify code tests', (() {
    test('Verify code request', (() {
      final address = faker.internet.email();
      final verificationCode = faker.lorem.word();

      final request = VerifyCodeRequest(address, verificationCode);
      expect(request.getEnvelope().toJson(), {
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
      final json = {
        'Body': {
          'VerifyCodeResponse': {
            '_jsns': 'urn:zimbraMail',
            'success': success,
          }
        }
      };
      final envelope = VerifyCodeEnvelope.fromJson(json);
      final response = envelope.verifyCodeBody.verifyCodeResponse!;
      expect(response.success, success);
    }));
  }));
}
