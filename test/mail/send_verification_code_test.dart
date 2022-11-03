import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/send_verification_code_envelope.dart';
import 'package:zimbra_api/src/mail/message/send_verification_code_request.dart';
import 'package:zimbra_api/src/mail/message/send_verification_code_response.dart';

void main() {
  final faker = Faker();

  group('Send verification code tests', (() {
    test('Send verification code request', (() {
      final address = faker.internet.email();

      final request = SendVerificationCodeRequest(address);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SendVerificationCodeRequest': {
            '_jsns': 'urn:zimbraMail',
            'a': address,
          }
        },
      });
    }));

    test('Send verification code response', (() {
      final data = {
        'Body': {
          'SendVerificationCodeResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SendVerificationCodeEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<SendVerificationCodeResponse>());
    }));
  }));
}
