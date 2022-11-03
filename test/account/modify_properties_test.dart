import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_properties_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_properties_request.dart';
import 'package:zimbra_api/src/account/message/modify_properties_response.dart';
import 'package:zimbra_api/src/account/type/prop.dart';

void main() {
  final faker = Faker();

  group('Modify properties tests', (() {
    test('Modify properties request', (() {
      final zimlet = faker.lorem.word();
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final request = ModifyPropertiesRequest(props: [Prop(zimlet, name, value: value)]);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyPropertiesRequest': {
            '_jsns': 'urn:zimbraAccount',
            'prop': [
              {
                'zimlet': zimlet,
                'name': name,
                '_content': value,
              }
            ],
          }
        },
      });
    }));

    test('Modify properties response', (() {
      final data = {
        'Body': {
          'ModifyPropertiesResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifyPropertiesEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<ModifyPropertiesResponse>());
    }));
  }));
}
