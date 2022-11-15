import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_modified_items_ids_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_modified_items_ids_request.dart';
import 'package:zimbra_api/src/mail/message/get_modified_items_ids_response.dart';

void main() {
  final faker = Faker();

  group('Get modified items ids tests', (() {
    test('Get modified items ids request', (() {
      final folderId = faker.randomGenerator.integer(100);
      final modSeq = faker.randomGenerator.integer(100);
      final request = GetModifiedItemsIDsRequest(folderId, modSeq);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetModifiedItemsIDsRequest': {
            '_jsns': 'urn:zimbraMail',
            'l': folderId,
            'ms': modSeq,
          }
        },
      });
    }));

    test('Get modified items ids response', (() {
      final id1 = faker.randomGenerator.integer(100);
      final id2 = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'GetModifiedItemsIDsResponse': {
            '_jsns': 'urn:zimbraMail',
            'ids': [
              {'_content': id1},
              {'_content': id2},
            ],
          }
        }
      };
      final envelope = GetModifiedItemsIDsEnvelope.fromMap(data);
      final response = envelope.body.response as GetModifiedItemsIDsResponse;
      expect(response.ids, [id1, id2]);
    }));
  }));
}
