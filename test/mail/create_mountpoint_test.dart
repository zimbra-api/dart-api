import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/view_type.dart';
import 'package:zimbra_api/src/mail/message/create_mountpoint_envelope.dart';
import 'package:zimbra_api/src/mail/message/create_mountpoint_request.dart';
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/new_mountpoint_spec.dart';

void main() {
  final faker = Faker();

  group('Create mountpoint tests', (() {
    test('Create mountpoint request', (() {
      final name = faker.lorem.word();
      final flags = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final url = faker.internet.httpsUrl();
      final folderId = faker.guid.guid();
      final fetchIfExists = faker.randomGenerator.boolean();
      final reminderEnabled = faker.randomGenerator.boolean();
      final ownerId = faker.guid.guid();
      final ownerName = faker.person.name();
      final remoteId = faker.randomGenerator.integer(100);
      final path = faker.lorem.word();

      final request = CreateMountpointRequest(NewMountpointSpec(name,
          defaultView: ViewType.conversation,
          flags: flags,
          color: color,
          rgb: rgb,
          url: url,
          folderId: folderId,
          fetchIfExists: fetchIfExists,
          reminderEnabled: reminderEnabled,
          ownerId: ownerId,
          ownerName: ownerName,
          remoteId: remoteId,
          path: path));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CreateMountpointRequest': {
            '_jsns': 'urn:zimbraMail',
            'link': {
              'name': name,
              'view': ViewType.conversation.name,
              'f': flags,
              'color': color,
              'rgb': rgb,
              'url': url,
              'l': folderId,
              'fie': fetchIfExists,
              'reminder': reminderEnabled,
              'zid': ownerId,
              'owner': ownerName,
              'rid': remoteId,
              'path': path,
            },
          }
        },
      });
    }));

    test('Create mountpoint response', (() {
      final id = faker.guid.guid();
      final uuid = faker.guid.guid();
      final name = faker.lorem.word();
      final absoluteFolderPath = faker.lorem.word();
      final parentId = faker.guid.guid();
      final folderUuid = faker.guid.guid();
      final flags = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final unreadCount = faker.randomGenerator.integer(100);
      final imapUnreadCount = faker.randomGenerator.integer(100);
      final revision = faker.randomGenerator.integer(100);
      final modifiedSequence = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().minute;
      final itemCount = faker.randomGenerator.integer(100);
      final imapItemCount = faker.randomGenerator.integer(100);
      final totalSize = faker.randomGenerator.integer(100);
      final imapModifiedSequence = faker.randomGenerator.integer(100);
      final imapUidNext = faker.randomGenerator.integer(100);
      final url = faker.internet.httpsUrl();
      final activeSyncDisabled = faker.randomGenerator.boolean();
      final webOfflineSyncDays = faker.randomGenerator.integer(100);
      final perm = faker.lorem.word();
      final recursive = faker.randomGenerator.boolean();
      final restUrl = faker.internet.httpsUrl();
      final deletable = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final lifetime = faker.randomGenerator.integer(100).toString();

      final internalGrantExpiry = faker.randomGenerator.integer(100);
      final guestGrantExpiry = faker.randomGenerator.integer(100);

      final granteeId = faker.guid.guid();
      final expiry = faker.randomGenerator.integer(100);
      final granteeName = faker.person.name();
      final guestPassword = faker.internet.password();
      final accessKey = faker.internet.password();

      final ownerEmail = faker.internet.email();
      final ownerAccountId = faker.guid.guid();
      final remoteFolderId = faker.randomGenerator.integer(100);
      final remoteUuid = faker.guid.guid();
      final remoteFolderName = faker.lorem.word();
      final reminderEnabled = faker.randomGenerator.boolean();
      final broken = faker.randomGenerator.boolean();

      final query = faker.lorem.word();
      final types = faker.lorem.words(3).join(',');

      final json = {
        'Body': {
          'CreateMountpointResponse': {
            '_jsns': 'urn:zimbraMail',
            'link': {
              'id': id,
              'uuid': uuid,
              'name': name,
              'owner': ownerEmail,
              'zid': ownerAccountId,
              'rid': remoteFolderId,
              'ruuid': remoteUuid,
              'oname': remoteFolderName,
              'reminder': reminderEnabled,
              'broken': broken,
              'absFolderPath': absoluteFolderPath,
              'l': parentId,
              'luuid': folderUuid,
              'f': flags,
              'color': color,
              'rgb': rgb,
              'u': unreadCount,
              'i4u': imapUnreadCount,
              'view': ViewType.conversation.name,
              'rev': revision,
              'ms': modifiedSequence,
              'md': changeDate,
              'n': itemCount,
              'i4n': imapItemCount,
              's': totalSize,
              'i4ms': imapModifiedSequence,
              'i4next': imapUidNext,
              'url': url,
              'activesyncdisabled': activeSyncDisabled,
              'webOfflineSyncDays': webOfflineSyncDays,
              'perm': perm,
              'recursive': recursive,
              'rest': restUrl,
              'deletable': deletable,
              'meta': [
                {
                  'section': section,
                  'a': [
                    {
                      'n': key,
                      '_content': value,
                    }
                  ],
                }
              ],
              'acl': {
                'internalGrantExpiry': internalGrantExpiry,
                'guestGrantExpiry': guestGrantExpiry,
                'grant': [
                  {
                    'perm': perm,
                    'gt': GrantGranteeType.all.name,
                    'zid': granteeId,
                    'expiry': expiry,
                    'd': granteeName,
                    'pw': guestPassword,
                    'key': accessKey,
                  }
                ],
              },
              'folder': [
                {
                  'id': id,
                  'uuid': uuid,
                  'name': name,
                }
              ],
              'link': [
                {
                  'id': id,
                  'name': name,
                  'owner': ownerEmail,
                  'zid': ownerAccountId,
                  'rid': remoteFolderId,
                  'ruuid': remoteUuid,
                  'oname': remoteFolderName,
                  'reminder': reminderEnabled,
                  'broken': broken,
                }
              ],
              'search': [
                {
                  'id': id,
                  'name': name,
                  'query': query,
                  'sortBy': SearchSortBy.none.name,
                  'types': types,
                }
              ],
              'retentionPolicy': {
                'keep': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ],
                },
                'purge': {
                  'policy': [
                    {
                      'type': PolicyType.user.name,
                      'id': id,
                      'name': name,
                      'lifetime': lifetime,
                    }
                  ],
                },
              },
            },
          }
        }
      };
      final envelope = CreateMountpointEnvelope.fromJson(json);
      final response = envelope.createMountpointBody.createMountpointResponse!;

      final mountpoint = response.mountpoint!;
      expect(mountpoint.id, id);
      expect(mountpoint.uuid, uuid);
      expect(mountpoint.name, name);
      expect(mountpoint.ownerEmail, ownerEmail);
      expect(mountpoint.ownerAccountId, ownerAccountId);
      expect(mountpoint.remoteFolderId, remoteFolderId);
      expect(mountpoint.remoteUuid, remoteUuid);
      expect(mountpoint.remoteFolderName, remoteFolderName);
      expect(mountpoint.reminderEnabled, reminderEnabled);
      expect(mountpoint.broken, broken);
      expect(mountpoint.absoluteFolderPath, absoluteFolderPath);
      expect(mountpoint.parentId, parentId);
      expect(mountpoint.folderUuid, folderUuid);
      expect(mountpoint.flags, flags);
      expect(mountpoint.color, color);
      expect(mountpoint.rgb, rgb);
      expect(mountpoint.unreadCount, unreadCount);
      expect(mountpoint.imapUnreadCount, imapUnreadCount);
      expect(mountpoint.view, ViewType.conversation);
      expect(mountpoint.revision, revision);
      expect(mountpoint.modifiedSequence, modifiedSequence);
      expect(mountpoint.changeDate, changeDate);
      expect(mountpoint.itemCount, itemCount);
      expect(mountpoint.imapItemCount, imapItemCount);
      expect(mountpoint.totalSize, totalSize);
      expect(mountpoint.imapModifiedSequence, imapModifiedSequence);
      expect(mountpoint.imapUidNext, imapUidNext);
      expect(mountpoint.url, url);
      expect(mountpoint.activeSyncDisabled, activeSyncDisabled);
      expect(mountpoint.webOfflineSyncDays, webOfflineSyncDays);
      expect(mountpoint.perm, perm);
      expect(mountpoint.recursive, recursive);
      expect(mountpoint.restUrl, restUrl);
      expect(mountpoint.deletable, deletable);

      final meta = mountpoint.metadatas.first;
      expect(meta.section, section);
      expect(meta.keyValuePairs.first.key, key);
      expect(meta.keyValuePairs.first.value, value);

      final acl = mountpoint.acl!;
      expect(acl.internalGrantExpiry, internalGrantExpiry);
      expect(acl.guestGrantExpiry, guestGrantExpiry);

      final grant = acl.grants.first;
      expect(grant.perm, perm);
      expect(grant.granteeType, GrantGranteeType.all);
      expect(grant.granteeId, granteeId);
      expect(grant.expiry, expiry);
      expect(grant.granteeName, granteeName);
      expect(grant.guestPassword, guestPassword);
      expect(grant.accessKey, accessKey);

      final subFolder = mountpoint.subFolders.first;
      expect(subFolder.id, id);
      expect(subFolder.uuid, uuid);
      expect(subFolder.name, name);
      expect(subFolder, isA<Folder>());

      final link = mountpoint.mountpoints.first;
      expect(link.id, id);
      expect(link.name, name);
      expect(link.ownerEmail, ownerEmail);
      expect(link.ownerAccountId, ownerAccountId);
      expect(link.remoteFolderId, remoteFolderId);
      expect(link.remoteUuid, remoteUuid);
      expect(link.remoteFolderName, remoteFolderName);
      expect(link.reminderEnabled, reminderEnabled);
      expect(link.broken, broken);
      expect(link, isA<Folder>());

      final search = mountpoint.searchFolders.first;
      expect(search.id, id);
      expect(search.name, name);
      expect(search.query, query);
      expect(search.sortBy, SearchSortBy.none);
      expect(search.types, types);
      expect(search, isA<Folder>());

      final retentionPolicy = mountpoint.retentionPolicy!;
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
