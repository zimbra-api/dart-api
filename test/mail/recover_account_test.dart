import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/channel.dart';
import 'package:zimbra_api/src/common/enum/recover_account_operation.dart';
import 'package:zimbra_api/src/mail/message/recover_account_envelope.dart';
import 'package:zimbra_api/src/mail/message/recover_account_request.dart';

void main() {
  final faker = Faker();

  group('Recover account tests', (() {
    test('Recover account request', (() {
      final email = faker.internet.email();

      final request = RecoverAccountRequest(
        email,
        RecoverAccountOperation.getRecoveryAccount,
        channel: Channel.email,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'RecoverAccountRequest': {
            '_jsns': 'urn:zimbraMail',
            'email': email,
            'op': RecoverAccountOperation.getRecoveryAccount.name,
            'channel': Channel.email.name,
          }
        },
      });
    }));

    test('Recover account response', (() {
      final recoveryAccount = faker.internet.email();
      final recoveryAttemptsLeft = faker.randomGenerator.integer(100);
      final json = {
        'Body': {
          'RecoverAccountResponse': {
            '_jsns': 'urn:zimbraMail',
            'recoveryAccount': recoveryAccount,
            'recoveryAttemptsLeft': recoveryAttemptsLeft,
          }
        }
      };
      final envelope = RecoverAccountEnvelope.fromJson(json);
      final response = envelope.recoverAccountBody.recoverAccountResponse!;
      expect(response.recoveryAccount, recoveryAccount);
      expect(response.recoveryAttemptsLeft, recoveryAttemptsLeft);
    }));
  }));
}
