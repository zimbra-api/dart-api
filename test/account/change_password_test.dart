import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/change_password_envelope.dart';
import 'package:zimbra_api/src/account/message/change_password_request.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';

void main() {
  final faker = Faker();

  group('Change password request tests', (() {
    test('To data test', () {
      final email = faker.internet.email();
      final oldPassword = faker.lorem.word();
      final password = faker.lorem.word();
      final virtualHost = faker.internet.domainName();
      final dryRun = faker.randomGenerator.boolean();

      final account = AccountSelector(AccountBy.name, email);

      final request = ChangePasswordRequest(account, oldPassword, password, virtualHost: virtualHost, dryRun: dryRun);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ChangePasswordRequest': {
            '_jsns': 'urn:zimbraAccount',
            'account': {
              'by': AccountBy.name.name,
              '_content': email,
            },
            'oldPassword': {
              '_content': oldPassword,
            },
            'password': {
              '_content': password,
            },
            'virtualHost': {
              '_content': virtualHost,
            },
            'dryRun': {
              '_content': dryRun,
            },
          }
        }
      });
    });
  }));

  group('Change password response tests', (() {
    test('From data test', (() {
      final authToken = faker.guid.guid();
      final lifetime = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'ChangePasswordResponse': {
            '_jsns': 'urn:zimbraAccount',
            'authToken': {
              '_content': authToken,
            },
            'lifetime': {
              '_content': lifetime,
            },
          },
        },
      };

      final envelope = ChangePasswordEnvelope.fromMap(data);
      final response = envelope.changePasswordBody.changePasswordResponse!;

      expect(response.authToken, authToken);
      expect(response.lifetime, lifetime);
    }));
  }));
}
