import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/mail/message/get_tag_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_tag_request.dart';
import 'package:zimbra_api/src/mail/message/get_tag_response.dart';

void main() {
  final faker = Faker();

  group('Get tag tests', (() {
    test('Get tag request', (() {
      final request = GetTagRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetTagRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get tag response', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final unread = faker.randomGenerator.integer(100);
      final count = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);
      final lifetime = faker.randomGenerator.integer(100).toString();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetTagResponse': {
            '_jsns': 'urn:zimbraMail',
            'tag': [
              {
                'id': id,
                'name': name,
                'color': color,
                'rgb': rgb,
                'u': unread,
                'n': count,
                'd': date,
                'rev': revision,
                'md': changeDate,
                'ms': modifiedSequence,
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  }
                ],
                'retentionPolicy': [
                  {
                  'keep': [
                    {
                      'policy': [
                        {
                          'type': PolicyType.user.name,
                          'id': id,
                          'name': name,
                          'lifetime': lifetime,
                        }
                        ],
                    }
                  ],
                  'purge': [
                    {
                      'policy': [
                        {
                          'type': PolicyType.user.name,
                          'id': id,
                          'name': name,
                          'lifetime': lifetime,
                        }
                        ],
                    }
                  ],
                  }
                ],
              },
            ],
          }
        }
      };
      final envelope = GetTagEnvelope.fromMap(data);
      final response = envelope.body.response as GetTagResponse;
      final tag = response.tags.first;

      expect(tag.id, id);
      expect(tag.name, name);
      expect(tag.color, color);
      expect(tag.rgb, rgb);
      expect(tag.unread, unread);
      expect(tag.count, count);
      expect(tag.date, date);
      expect(tag.revision, revision);
      expect(tag.changeDate, changeDate);
      expect(tag.modifiedSequence, modifiedSequence);

      final meta = tag.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final retentionPolicy = tag.retentionPolicy!;
      final keep = retentionPolicy.keep.first;
      final purge = retentionPolicy.purge.first;
      expect(keep.type, PolicyType.user);
      expect(keep.id, id);
      expect(keep.name, name);
      expect(keep.lifetime, lifetime);
      expect(purge.type, PolicyType.user);
      expect(purge.id, id);
      expect(purge.name, name);
      expect(purge.lifetime, lifetime);
    }));
  }));
}
