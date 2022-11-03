import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/client_info_envelope.dart';
import 'package:zimbra_api/src/account/message/client_info_request.dart';
import 'package:zimbra_api/src/common/enum/domain_by.dart';
import 'package:zimbra_api/src/common/type/domain_selector.dart';

void main() {
  final faker = Faker();

  group('Client info request tests', (() {
    test('To data test', () {
      final domainName = faker.internet.domainName();
      final domain = DomainSelector(DomainBy.name, domainName);

      final request = ClientInfoRequest(domain);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ClientInfoRequest': {
            '_jsns': 'urn:zimbraAccount',
            'domain': {
              'by': DomainBy.name.name,
              '_content': domainName,
            },
          }
        }
      });
    });
  }));

  group('Client info response tests', () {
    test('From data test', () {
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final data = {
        'Body': {
          'ClientInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'a': [
              {
                'n': key,
                '_content': value,
              },
            ],
          },
        },
      };

      final envelope = ClientInfoEnvelope.fromMap(data);
      final response = envelope.clientInfoBody.clientInfoResponse!;
      final attr = response.attrs.first;

      expect(attr.key, key);
      expect(attr.value, value);
    });
  });
}
