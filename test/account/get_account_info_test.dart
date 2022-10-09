import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_account_info_envelope.dart';
import 'package:zimbra_api/src/account/message/get_account_info_request.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';

void main() {
  final faker = Faker();

  group('Get account info tests', (() {
    test('Get account info request', (() {
      final name = faker.internet.email();
      final account = AccountSelector(AcccountBy.name, name);
      final request = GetAccountInfoRequest(account);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetAccountInfoRequest': {
            '_jsns': 'urn:zimbraAccount',
            'account': {
              'by': AcccountBy.name.name,
              '_content': name,
            },
          }
        },
      });
    }));

    test('Get account info response', (() {
      final email = faker.internet.email();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final soapURL = faker.internet.httpsUrl();
      final publicURL = faker.internet.httpsUrl();
      final changePasswordURL = faker.internet.httpsUrl();
      final communityURL = faker.internet.httpsUrl();
      final adminURL = faker.internet.httpsUrl();
      final boshURL = faker.internet.httpsUrl();

      final json = {
        'Body': {
          'GetAccountInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'name': email,
            'attr': [
              {
                'name': name,
                '_content': value,
              }
            ],
            'soapURL': soapURL,
            'publicURL': publicURL,
            'changePasswordURL': changePasswordURL,
            'communityURL': communityURL,
            'adminURL': adminURL,
            'boshURL': boshURL,
          },
        },
      };
      final envelope = GetAccountInfoEnvelope.fromJson(json);
      final response = envelope.getAccountInfoBody.getAccountInfoResponse;
      final attr = response!.attrs.first;

      expect(response.name, email);
      expect(response.soapURL, soapURL);
      expect(response.publicURL, publicURL);
      expect(response.changePasswordURL, changePasswordURL);
      expect(response.communityURL, communityURL);
      expect(response.adminURL, adminURL);
      expect(response.boshURL, boshURL);
      expect(attr.name, name);
      expect(attr.value, value);
    }));
  }));
}