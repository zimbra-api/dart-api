import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_signatures_envelope.dart';
import 'package:zimbra_api/src/account/message/get_signatures_request.dart';
import 'package:zimbra_api/src/account/message/get_signatures_response.dart';
import 'package:zimbra_api/src/common/enum/content_type.dart';

void main() {
  final faker = Faker();

  group('Get signatures tests', (() {
    test('Get signatures request', (() {
      final request = GetSignaturesRequest();

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetSignaturesRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get signatures response', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetSignaturesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'signature': [
              {
                'name': name,
                'id': id,
                'cid': cid,
                'content': [
                  {
                    'type': ContentType.textHtml.name,
                    '_content': value,
                  },
                ],
              }
            ],
          }
        }
      };
      final envelope = GetSignaturesEnvelope.fromMap(data);
      final response = envelope.body.response as GetSignaturesResponse;
      final signature = response.signatures.first;

      expect(signature.name, name);
      expect(signature.id, id);
      expect(signature.cid, cid);

      final content = signature.contents.first;
      expect(content.type, ContentType.textHtml);
      expect(content.value, value);
    }));
  }));
}
