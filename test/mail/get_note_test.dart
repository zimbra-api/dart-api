import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/mail/message/get_note_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_note_request.dart';
import 'package:zimbra_api/src/mail/message/get_note_response.dart';

void main() {
  final faker = Faker();

  group('Get note tests', (() {
    test('Get note request', (() {
      final id = faker.guid.guid();
      final request = GetNoteRequest(Id(id: id));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetNoteRequest': {
            '_jsns': 'urn:zimbraMail',
            'note': {'id': id},
          }
        },
      });
    }));

    test('Get note response', (() {
      final id = faker.guid.guid();
      final flags = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final revision = faker.randomGenerator.integer(100);
      final modifiedSequence = faker.randomGenerator.integer(100);
      final folder = faker.guid.guid();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final bounds = faker.lorem.word();
      final content = faker.lorem.word();
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final changeDate = faker.date.dateTime().minute;
      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetNoteResponse': {
            '_jsns': 'urn:zimbraMail',
            'note': {
              'id': id,
              'rev': revision,
              'l': folder,
              'd': date,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'pos': bounds,
              'color': color,
              'rgb': rgb,
              'md': changeDate,
              'ms': modifiedSequence,
              'content': content,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
            },
          }
        }
      };
      final envelope = GetNoteEnvelope.fromMap(data);
      final respnose = envelope.body.response as GetNoteResponse;
      final note = respnose.note!;

      expect(note.id, id);
      expect(note.revision, revision);
      expect(note.folder, folder);
      expect(note.date, date);
      expect(note.flags, flags);
      expect(note.tags, tags);
      expect(note.tagNames, tagNames);
      expect(note.bounds, bounds);
      expect(note.color, color);
      expect(note.rgb, rgb);
      expect(note.changeDate, changeDate);
      expect(note.modifiedSequence, modifiedSequence);
      expect(note.content, content);

      final meta = note.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);
    }));
  }));
}
