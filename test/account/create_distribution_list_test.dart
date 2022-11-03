import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/create_distribution_list_envelope.dart';
import 'package:zimbra_api/src/account/message/create_distribution_list_request.dart';
import 'package:zimbra_api/src/account/message/create_distribution_list_response.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';

void main() {
  final faker = Faker();

  group('Create distribution list tests', (() {
    test('Create distribution list request', (() {
      final name = faker.internet.email();
      final isDynamic = faker.randomGenerator.boolean();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final request =
          CreateDistributionListRequest(name, isDynamic: isDynamic, keyValuePairs: [KeyValuePair(key, value: value)]);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'CreateDistributionListRequest': {
            '_jsns': 'urn:zimbraAccount',
            'name': name,
            'dynamic': isDynamic,
            'a': [
              {
                'n': key,
                '_content': value,
              },
            ],
          }
        }
      });
    }));

    test('Create distribution list response', (() {
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final ref = faker.internet.email();
      final displayName = faker.person.name();
      final isDynamic = faker.randomGenerator.boolean();
      final via = faker.internet.email();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'name': name,
              'id': id,
              'ref': ref,
              'd': displayName,
              'dynamic': isDynamic,
              'via': via,
              'isOwner': isOwner,
              'isMember': isMember,
              'a': [
                {
                  'n': key,
                  '_content': value,
                },
              ],
            },
          },
        },
      };
      final envelope = CreateDistributionListEnvelope.fromMap(data);
      final response = envelope.body.response as CreateDistributionListResponse;
      final dl = response.dl;

      expect(dl!.name, name);
      expect(dl.id, id);
      expect(dl.ref, ref);
      expect(dl.displayName, displayName);
      expect(dl.isDynamic, isDynamic);
      expect(dl.via, via);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);

      final attr = dl.attrList.first;
      expect(attr.key, key);
      expect(attr.value, value);
    }));
  }));
}
