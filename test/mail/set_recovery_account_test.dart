import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/channel.dart';
import 'package:zimbra_api/src/common/enum/recovery_account_operation.dart';
import 'package:zimbra_api/src/mail/message/set_recovery_account_envelope.dart';
import 'package:zimbra_api/src/mail/message/set_recovery_account_request.dart';
import 'package:zimbra_api/src/mail/message/set_recovery_account_response.dart';

void main() {
  final faker = Faker();

  group('Set recover account tests', (() {
    test('Set recover account request', (() {
      final recoveryAccount = faker.internet.email();
      final verificationCode = faker.lorem.word();

      final request = SetRecoveryAccountRequest(
        RecoveryAccountOperation.sendCode,
        recoveryAccount,
        verificationCode,
        channel: Channel.email,
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'SetRecoveryAccountRequest': {
            '_jsns': 'urn:zimbraMail',
            'op': RecoveryAccountOperation.sendCode.name,
            'recoveryAccount': recoveryAccount,
            'recoveryAccountVerificationCode': verificationCode,
            'channel': Channel.email.name,
          }
        },
      });
    }));

    test('Set recover account response', (() {
      final data = {
        'Body': {
          'SetRecoveryAccountResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SetRecoveryAccountEnvelope.fromMap(data);
      expect(envelope.setRecoveryAccountBody.setRecoveryAccountResponse, isNotNull);
      expect(envelope.setRecoveryAccountBody.setRecoveryAccountResponse, isA<SetRecoveryAccountResponse>());
    }));
  }));
}
