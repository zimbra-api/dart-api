import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/share_action.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/message/send_share_notification_envelope.dart';
import 'package:zimbra_api/src/mail/message/send_share_notification_request.dart';
import 'package:zimbra_api/src/mail/message/send_share_notification_response.dart';
import 'package:zimbra_api/src/mail/type/email_addr_info.dart';

void main() {
  final faker = Faker();

  group('Send share notification tests', (() {
    test('Send share notification request', (() {
      final id = faker.guid.guid();
      final address = faker.internet.email();
      final addressType = faker.randomGenerator.element(AddressType.values);
      final personal = faker.person.name();
      final action = faker.randomGenerator.element(ShareAction.values);
      final notes = faker.lorem.word();

      final request = SendShareNotificationRequest(
        Id(id: id),
        emailAddresses: [EmailAddrInfo(address, addressType: addressType, personal: personal)],
        action: action,
        notes: notes,
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'SendShareNotificationRequest': {
            '_jsns': 'urn:zimbraMail',
            'item': {
              'id': id,
            },
            'e': [
              {
                'a': address,
                't': addressType.name,
                'p': personal,
              }
            ],
            'action': action.name,
            'notes': {'_content': notes},
          }
        },
      });
    }));

    test('Send share notification response', (() {
      final json = {
        'Body': {
          'SendShareNotificationResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = SendShareNotificationEnvelope.fromJson(json);
      final response = envelope.sendShareNotificationBody.sendShareNotificationResponse;
      expect(response, isNotNull);
      expect(response, isA<SendShareNotificationResponse>());
    }));
  }));
}
