import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/mail/message/bounce_msg_envelope.dart';
import 'package:zimbra_api/src/mail/message/bounce_msg_request.dart';
import 'package:zimbra_api/src/mail/message/bounce_msg_response.dart';
import 'package:zimbra_api/src/mail/type/bounce_msg_spec.dart';
import 'package:zimbra_api/src/mail/type/email_addr_info.dart';

void main() {
  final faker = Faker();

  group('Bounce msg tests', (() {
    test('Bounce msg request', (() {
      final id = faker.guid.guid();
      final address = faker.internet.email();
      final personal = faker.person.name();
      final request = BounceMsgRequest(BounceMsgSpec(id, emailAddresses: [
        EmailAddrInfo(
          address,
          addressType: AddressType.from,
          personal: personal,
        )
      ]));

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'BounceMsgRequest': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'id': id,
              'e': [
                {
                  'a': address,
                  't': AddressType.from.name,
                  'p': personal,
                }
              ],
            },
          }
        },
      });
    }));

    test('Bounce msg response', (() {
      final data = {
        'Body': {
          'BounceMsgResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = BounceMsgEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<BounceMsgResponse>());
    }));
  }));
}
