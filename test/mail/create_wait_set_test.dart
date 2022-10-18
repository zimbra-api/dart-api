import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/interest_type.dart';
import 'package:zimbra_api/src/common/type/wait_set_add_spec.dart';
import 'package:zimbra_api/src/mail/message/create_wait_set_envelope.dart';
import 'package:zimbra_api/src/mail/message/create_wait_set_request.dart';

void main() {
  final faker = Faker();

  group('Create WaitSet tests', (() {
    test('Create WaitSet request', (() {
      final defaultInterests = faker.randomGenerator
          .amount((_) => random.element(InterestType.values).name, InterestType.values.length)
          .toSet()
          .join(',');
      final allAccounts = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final name = faker.internet.email();
      final token = faker.guid.guid();
      final interests = faker.randomGenerator
          .amount((_) => random.element(InterestType.values).name, InterestType.values.length)
          .toSet()
          .join(',');
      final folderInterests = [
        faker.guid.guid(),
        faker.guid.guid(),
        faker.guid.guid(),
      ].join(',');

      final request = CreateWaitSetRequest(
        defaultInterests: defaultInterests,
        allAccounts: allAccounts,
        accounts: [
          WaitSetAddSpec(
            name: name,
            id: id,
            token: token,
            interests: interests,
            folderInterests: folderInterests,
          )
        ],
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CreateWaitSetRequest': {
            '_jsns': 'urn:zimbraMail',
            'defTypes': defaultInterests,
            'allAccounts': allAccounts,
            'add': {
              'a': [
                {
                  'name': name,
                  'id': id,
                  'token': token,
                  'types': interests,
                  'folderInterests': folderInterests,
                }
              ]
            },
          }
        },
      });
    }));

    test('Create WaitSet respone', (() {
      final waitSetId = faker.guid.guid();
      final defaultInterests = faker.randomGenerator
          .amount((_) => random.element(InterestType.values).name, InterestType.values.length)
          .toSet()
          .join(',');
      final sequence = faker.randomGenerator.integer(100);
      final id = faker.guid.guid();
      final type = faker.lorem.word();

      final json = {
        'Body': {
          'CreateWaitSetResponse': {
            '_jsns': 'urn:zimbraMail',
            'waitSet': waitSetId,
            'defTypes': defaultInterests,
            'seq': sequence,
            'error': [
              {
                'id': id,
                'type': type,
              }
            ],
          }
        }
      };
      final envelope = CreateWaitSetEnvelope.fromJson(json);
      final response = envelope.createWaitSetBody.createWaitSetResponse!;

      expect(response.waitSetId, waitSetId);
      expect(response.defaultInterests, defaultInterests);
      expect(response.sequence, sequence);

      final error = response.errors.first;
      expect(error.id, id);
      expect(error.type, type);
    }));
  }));
}
