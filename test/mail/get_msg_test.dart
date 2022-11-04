import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
import 'package:zimbra_api/src/common/enum/msg_content.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';
import 'package:zimbra_api/src/mail/message/get_msg_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_msg_request.dart';
import 'package:zimbra_api/src/mail/message/get_msg_response.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/msg_spec.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';

void main() {
  final faker = Faker();

  group('Get message tests', (() {
    test('Get message request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final part = faker.lorem.word();
      final raw = faker.randomGenerator.boolean();
      final markRead = faker.randomGenerator.boolean();
      final maxInlinedLength = faker.randomGenerator.integer(100);
      final useContentUrl = faker.randomGenerator.boolean();
      final wantHtml = faker.randomGenerator.boolean();
      final wantImapUid = faker.randomGenerator.boolean();
      final wantModifiedSequence = faker.randomGenerator.boolean();
      final neuter = faker.randomGenerator.boolean();
      final recurIdZ = faker.date.dateTime().toString();
      final needCanExpand = faker.randomGenerator.boolean();

      final request = GetMsgRequest(
        MsgSpec(
          id: id,
          part: part,
          raw: raw,
          markRead: markRead,
          maxInlinedLength: maxInlinedLength,
          useContentUrl: useContentUrl,
          wantHtml: wantHtml,
          wantImapUid: wantImapUid,
          wantModifiedSequence: wantModifiedSequence,
          neuter: neuter,
          recurIdZ: recurIdZ,
          needCanExpand: needCanExpand,
          wantContent: MsgContent.full,
          headers: [AttributeName(name: name)],
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetMsgRequest': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'id': id,
              'part': part,
              'raw': raw,
              'read': markRead,
              'max': maxInlinedLength,
              'useContentUrl': useContentUrl,
              'html': wantHtml,
              'wantImapUid': wantImapUid,
              'wantModSeq': wantModifiedSequence,
              'neuter': neuter,
              'ridZ': recurIdZ,
              'needExp': needCanExpand,
              'wantContent': MsgContent.full.name,
              'header': [
                {
                  'n': name,
                }
              ],
            },
          }
        },
      });
    }));

    test('Get message response', (() {
      final id = faker.guid.guid();
      final imapUid = faker.randomGenerator.integer(100);
      final calendarIntendedFor = faker.internet.email();
      final origId = faker.guid.guid();
      final identityId = faker.guid.guid();
      final draftAccountId = faker.guid.guid();
      final draftAutoSendTime = faker.randomGenerator.integer(100);
      final sentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final resentDate = faker.date.dateTime().millisecondsSinceEpoch;
      final part = faker.lorem.word();
      final fragment = faker.lorem.word();
      final subject = faker.lorem.word();
      final messageIdHeader = faker.guid.guid();
      final inReplyTo = faker.internet.email();
      final size = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final folder = faker.guid.guid();
      final conversationId = faker.guid.guid();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final revision = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequence = faker.randomGenerator.integer(100);

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.lorem.word();
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();

      final url = faker.internet.httpsUrl();
      final path = faker.lorem.word();
      final section = faker.lorem.word();
      final name = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final content = faker.lorem.word();
      final contentType = faker.lorem.word();
      final contentId = faker.guid.guid();
      final attachmentId = faker.guid.guid();
      final messageId = faker.guid.guid();
      final truncatedContent = faker.randomGenerator.boolean();
      final optional = faker.randomGenerator.boolean();
      final version = faker.randomGenerator.integer(100);

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();
      final recurrenceId = faker.date.dateTime().toString();
      final seq = faker.randomGenerator.integer(100);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();

      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final displayName = faker.person.name();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();
      final utcTime = faker.date.dateTime().millisecond;
      final dateTimeString = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final summary = faker.guid.guid();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final num = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final rsvp = faker.randomGenerator.boolean();
      final uri = faker.internet.uri('http');
      final method = faker.lorem.word();
      final componentNum = faker.randomGenerator.integer(100);
      final sequence = faker.randomGenerator.integer(100);
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final uid = faker.guid.guid();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final dateTime = faker.randomGenerator.integer(100);
      final calItemFolder = faker.lorem.word();
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final data = {
        'Body': {
          'GetMsgResponse': {
            '_jsns': 'urn:zimbraMail',
            'm': {
              'id': id,
              'i4uid': imapUid,
              'cif': calendarIntendedFor,
              'origid': origId,
              'rt': ReplyType.replied.name,
              'idnt': identityId,
              'forAcct': draftAccountId,
              'autoSendTime': draftAutoSendTime,
              'sd': sentDate,
              'rd': resentDate,
              'part': part,
              'fr': {'_content': fragment},
              'e': [
                {
                  'a': address,
                  'd': display,
                  'p': personal,
                  't': AddressType.from.name,
                  'isGroup': isGroup,
                  'exp': canExpandGroupMembers,
                }
              ],
              'su': {'_content': subject},
              'mid': {'_content': messageIdHeader},
              'irt': {'_content': inReplyTo},
              'inv': {
                'type': InviteType.appt.name,
                'tz': [
                  {
                    'id': id,
                    'stdoff': tzStdOffset,
                    'dayoff': tzDayOffset,
                    'standard': {
                      'mon': month,
                      'hour': hour,
                      'min': minute,
                      'sec': second,
                      'mday': dayOfMonth,
                      'week': week,
                      'wkday': dayOfWeek,
                    },
                    'daylight': {
                      'mon': month,
                      'hour': hour,
                      'min': minute,
                      'sec': second,
                      'mday': dayOfMonth,
                      'week': week,
                      'wkday': dayOfWeek,
                    },
                    'stdname': standardTZName,
                    'dayname': daylightTZName,
                  }
                ],
                'comp': [
                  {
                    'category': [
                      {'_content': category}
                    ],
                    'comment': [
                      {'_content': comment}
                    ],
                    'contact': [
                      {'_content': contact}
                    ],
                    'geo': {
                      'lat': latitude,
                      'lon': longitude,
                    },
                    'at': [
                      {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'cutype': cuType,
                        'role': role,
                        'ptst': partStat.name,
                        'rsvp': rsvp,
                        'member': member,
                        'delegatedTo': delegatedTo,
                        'delegatedFrom': delegatedFrom,
                        'xparam': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'alarm': [
                      {
                        'action': AlarmAction.display.name,
                        'trigger': {
                          'abs': {
                            'd': dateTimeString,
                          },
                          'rel': {
                            'd': dateTimeString,
                          },
                        },
                        'repeat': {
                          'neg': durationNegative,
                          'w': weeks,
                          'd': days,
                          'h': hours,
                          'm': minutes,
                          's': seconds,
                          'related': AlarmRelated.start.name,
                          'count': repeatCount,
                        },
                        'desc': {'_content': description},
                        'attach': {
                          'uri': uri,
                          'ct': contentType,
                          '_content': binaryB64Data,
                        },
                        'summary': {'_content': summary},
                        'at': [
                          {
                            'a': address,
                            'url': url,
                            'd': displayName,
                            'sentBy': sentBy,
                            'dir': dir,
                            'lang': language,
                            'cutype': cuType,
                            'role': role,
                            'ptst': partStat.name,
                            'rsvp': rsvp,
                            'member': member,
                            'delegatedTo': delegatedTo,
                            'delegatedFrom': delegatedFrom,
                            'xparam': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                        'xprop': [
                          {
                            'name': name,
                            'value': value,
                            'xparam': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                      }
                    ],
                    'xprop': [
                      {
                        'name': name,
                        'value': value,
                        'xparam': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'fr': {'_content': fragment},
                    'desc': {'_content': description},
                    'descHtml': {'_content': htmlDescription},
                    'or': {
                      'a': address,
                      'url': url,
                      'd': displayName,
                      'sentBy': sentBy,
                      'dir': dir,
                      'lang': language,
                      'xparam': [
                        {
                          'name': name,
                          'value': value,
                        }
                      ],
                    },
                    'recur': {
                      'add': [
                        {'add': {}}
                      ],
                      'exclude': [
                        {'exclude': {}}
                      ],
                      'except': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                          'add': {'add': []},
                          'exclude': {'exclude': []},
                        }
                      ],
                      'cancel': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                        }
                      ],
                      'dates': [
                        {
                          'tz': timezone,
                          'dtval': [
                            {
                              's': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'e': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'dur': {
                                'neg': durationNegative,
                                'w': weeks,
                                'd': days,
                                'h': hours,
                                'm': minutes,
                                's': seconds,
                                'related': AlarmRelated.start.name,
                                'count': repeatCount,
                              },
                            }
                          ],
                        }
                      ],
                      'rule': [
                        {
                          'freq': Frequency.second.name,
                          'until': {
                            'd': dateTimeString,
                          },
                          'count': {
                            'num': num,
                          },
                          'interval': {
                            'ival': ival,
                          },
                          'bysecond': {
                            'seclist': list,
                          },
                          'byminute': {
                            'minlist': list,
                          },
                          'byhour': {
                            'hrlist': list,
                          },
                          'byday': {
                            'wkday': [
                              {
                                'day': WeekDay.sunday.name,
                                'ordWk': ordWk,
                              }
                            ],
                          },
                          'bymonthday': {
                            'modaylist': list,
                          },
                          'byyearday': {
                            'yrdaylist': list,
                          },
                          'byweekno': {
                            'wklist': list,
                          },
                          'bymonth': {
                            'molist': list,
                          },
                          'bysetpos': {
                            'poslist': list,
                          },
                          'wkst': {
                            'day': WeekDay.sunday.name,
                          },
                          'rule-x-name': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                    },
                    'exceptId': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'rangeType': recurrenceRangeType,
                    },
                    's': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'e': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'dur': {
                      'neg': durationNegative,
                      'w': weeks,
                      'd': days,
                      'h': hours,
                      'm': minutes,
                      's': seconds,
                      'related': AlarmRelated.start.name,
                      'count': repeatCount,
                    },
                    'method': method,
                    'compNum': componentNum,
                    'rsvp': rsvp,
                    'priority': priority,
                    'name': name,
                    'loc': location,
                    'percentComplete': percentComplete,
                    'completed': completed,
                    'noBlob': noBlob,
                    'fba': FreeBusyStatus.free.name,
                    'fb': FreeBusyStatus.free.name,
                    'transp': Transparency.opaque.name,
                    'isOrg': isOrganizer,
                    'x_uid': xUid,
                    'uid': uid,
                    'seq': sequence,
                    'd': dateTime,
                    'calItemId': calItemId,
                    'apptId': deprecatedApptId,
                    'ciFolder': calItemFolder,
                    'status': InviteStatus.completed.name,
                    'class': InviteClass.public.name,
                    'url': url,
                    'ex': isException,
                    'ridZ': recurIdZ,
                    'allDay': isAllDay,
                    'draft': isDraft,
                    'neverSent': neverSent,
                    'changes': changes,
                  }
                ],
                'replies': {
                  'reply': [
                    {
                      'rangeType': recurrenceRangeType,
                      'recurId': recurrenceId,
                      'seq': seq,
                      'd': date,
                      'at': attendee,
                      'sentBy': sentBy,
                      'ptst': partStat.name,
                      'tz': timezone,
                      'ridZ': recurIdZ,
                    }
                  ]
                },
              },
              'header': [
                {
                  'n': key,
                  '_content': value,
                }
              ],
              'mp': {
                'ct': contentType,
                'content': content,
                'ci': contentId,
                'attach': {
                  'aid': attachmentId,
                  'mp': [
                    {
                      'mid': messageId,
                      'part': part,
                      'optional': optional,
                    }
                  ],
                  'm': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'cn': [
                    {
                      'id': id,
                      'optional': optional,
                    }
                  ],
                  'doc': [
                    {
                      'path': path,
                      'id': id,
                      'ver': version,
                      'optional': optional,
                    }
                  ],
                },
                'mp': [
                  {
                    'ct': contentType,
                    'content': content,
                    'ci': contentId,
                  }
                ],
              },
              'shr': {
                'truncated': truncatedContent,
                'content': {'_content': content},
              },
              'dlSubs': {
                'truncated': truncatedContent,
                'content': {'_content': content},
              },
              'content': {
                'url': url,
                '_content': value,
              },
              's': size,
              'd': date,
              'l': folder,
              'cid': conversationId,
              'f': flags,
              't': tags,
              'tn': tagNames,
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
            },
          }
        }
      };
      final envelope = GetMsgEnvelope.fromMap(data);
      final response = envelope.body.response as GetMsgResponse;
      final msg = response.msg!;

      expect(msg.id, id);
      expect(msg.imapUid, imapUid);
      expect(msg.calendarIntendedFor, calendarIntendedFor);
      expect(msg.origId, origId);
      expect(msg.draftReplyType, ReplyType.replied);
      expect(msg.identityId, identityId);
      expect(msg.draftAccountId, draftAccountId);
      expect(msg.draftAutoSendTime, draftAutoSendTime);
      expect(msg.sentDate, sentDate);
      expect(msg.resentDate, resentDate);
      expect(msg.part, part);
      expect(msg.fragment, fragment);
      expect(msg.subject, subject);
      expect(msg.messageIdHeader, messageIdHeader);
      expect(msg.inReplyTo, inReplyTo);
      expect(msg.size, size);
      expect(msg.date, date);
      expect(msg.folder, folder);
      expect(msg.conversationId, conversationId);
      expect(msg.flags, flags);
      expect(msg.tags, tags);
      expect(msg.tagNames, tagNames);
      expect(msg.revision, revision);
      expect(msg.changeDate, changeDate);
      expect(msg.modifiedSequence, modifiedSequence);

      final msgMeta = msg.metadatas.first;
      expect(msgMeta.section, section);
      expect(msgMeta.keyValuePairs.first.key, key);
      expect(msgMeta.keyValuePairs.first.value, value);

      final email = msg.emails.first;
      expect(email.address, address);
      expect(email.display, display);
      expect(email.personal, personal);
      expect(email.addressType, AddressType.from);
      expect(email.isGroup, isGroup);
      expect(email.canExpandGroupMembers, canExpandGroupMembers);

      final header = msg.headers.first;
      expect(header.key, key);
      expect(header.value, value);

      final mimePart = msg.mimePart!;
      expect(mimePart.contentType, contentType);
      expect(mimePart.content, content);
      expect(mimePart.contentId, contentId);
      expect(mimePart.mimeParts.first.contentType, contentType);
      expect(mimePart.mimeParts.first.content, content);
      expect(mimePart.mimeParts.first.contentId, contentId);

      final mpAttach = mimePart.attachments!;
      expect(mpAttach.attachmentId, attachmentId);

      final mpAttachment = mpAttach.mpAttachments.first;
      expect(mpAttachment.messageId, messageId);
      expect(mpAttachment.part, part);
      expect(mpAttachment.optional, optional);

      final msgAttachment = mpAttach.msgAttachments.first;
      expect(msgAttachment.id, id);
      expect(msgAttachment.optional, optional);

      final cnAttachment = mpAttach.cnAttachments.first;
      expect(cnAttachment.id, id);
      expect(cnAttachment.optional, optional);

      final docAttachment = mpAttach.docAttachments.first;
      expect(docAttachment.path, path);
      expect(docAttachment.id, id);
      expect(docAttachment.version, version);
      expect(docAttachment.optional, optional);

      final shrNotification = msg.shrNotification!;
      expect(shrNotification.content, content);
      expect(shrNotification.truncatedContent, truncatedContent);

      final dlSubsNotification = msg.dlSubsNotification!;
      expect(dlSubsNotification.content, content);
      expect(dlSubsNotification.truncatedContent, truncatedContent);

      final msgContent = msg.content!;
      expect(msgContent.url, url);
      expect(msgContent.value, value);

      final invite = msg.invite!;
      expect(invite.calItemType, InviteType.appt);

      final inviteTz = invite.timezones.first;
      expect(inviteTz.id, id);
      expect(inviteTz.tzStdOffset, tzStdOffset);
      expect(inviteTz.tzDayOffset, tzDayOffset);
      expect(inviteTz.standardTZName, standardTZName);
      expect(inviteTz.daylightTZName, daylightTZName);

      final tzStandard = inviteTz.standardTzOnset!;
      expect(tzStandard.month, month);
      expect(tzStandard.hour, hour);
      expect(tzStandard.minute, minute);
      expect(tzStandard.second, second);
      expect(tzStandard.dayOfMonth, dayOfMonth);
      expect(tzStandard.week, week);
      expect(tzStandard.dayOfWeek, dayOfWeek);

      final tzDaylight = inviteTz.daylightTzOnset!;
      expect(tzDaylight.month, month);
      expect(tzDaylight.hour, hour);
      expect(tzDaylight.minute, minute);
      expect(tzDaylight.second, second);
      expect(tzDaylight.dayOfMonth, dayOfMonth);
      expect(tzDaylight.week, week);
      expect(tzDaylight.dayOfWeek, dayOfWeek);

      final inviteReply = invite.calendarReplies.first;
      expect(inviteReply.recurrenceRangeType, recurrenceRangeType);
      expect(inviteReply.recurrenceRangeType, recurrenceRangeType);
      expect(inviteReply.recurrenceId, recurrenceId);
      expect(inviteReply.seq, seq);
      expect(inviteReply.date, date);
      expect(inviteReply.attendee, attendee);
      expect(inviteReply.sentBy, sentBy);
      expect(inviteReply.partStat, partStat);
      expect(inviteReply.timezone, timezone);
      expect(inviteReply.recurIdZ, recurIdZ);

      final inviteComponent = invite.inviteComponents.first;
      expect(inviteComponent.method, method);
      expect(inviteComponent.componentNum, componentNum);
      expect(inviteComponent.rsvp, rsvp);
      expect(inviteComponent.priority, priority);
      expect(inviteComponent.name, name);
      expect(inviteComponent.location, location);
      expect(inviteComponent.percentComplete, percentComplete);
      expect(inviteComponent.completed, completed);
      expect(inviteComponent.noBlob, noBlob);
      expect(inviteComponent.freeBusyActual, FreeBusyStatus.free);
      expect(inviteComponent.freeBusy, FreeBusyStatus.free);
      expect(inviteComponent.transparency, Transparency.opaque);
      expect(inviteComponent.isOrganizer, isOrganizer);
      expect(inviteComponent.xUid, xUid);
      expect(inviteComponent.uid, uid);
      expect(inviteComponent.sequence, sequence);
      expect(inviteComponent.dateTime, dateTime);
      expect(inviteComponent.calItemId, calItemId);
      expect(inviteComponent.deprecatedApptId, deprecatedApptId);
      expect(inviteComponent.calItemFolder, calItemFolder);
      expect(inviteComponent.status, InviteStatus.completed);
      expect(inviteComponent.calClass, InviteClass.public);
      expect(inviteComponent.url, url);
      expect(inviteComponent.isException, isException);
      expect(inviteComponent.recurIdZ, recurIdZ);
      expect(inviteComponent.isAllDay, isAllDay);
      expect(inviteComponent.isDraft, isDraft);
      expect(inviteComponent.neverSent, neverSent);
      expect(inviteComponent.changes, changes);

      expect(inviteComponent.fragment, fragment);
      expect(inviteComponent.description, description);
      expect(inviteComponent.htmlDescription, htmlDescription);

      expect(inviteComponent.categories.first, category);
      expect(inviteComponent.comments.first, comment);
      expect(inviteComponent.contacts.first, contact);

      final inviteGeo = inviteComponent.geo!;
      expect(inviteGeo.latitude, latitude);
      expect(inviteGeo.longitude, longitude);

      final inviteAt = inviteComponent.attendees.first;
      expect(inviteAt.address, address);
      expect(inviteAt.url, url);
      expect(inviteAt.displayName, displayName);
      expect(inviteAt.sentBy, sentBy);
      expect(inviteAt.dir, dir);
      expect(inviteAt.language, language);
      expect(inviteAt.cuType, cuType);
      expect(inviteAt.role, role);
      expect(inviteAt.partStat, partStat);
      expect(inviteAt.rsvp, rsvp);
      expect(inviteAt.member, member);
      expect(inviteAt.delegatedTo, delegatedTo);
      expect(inviteAt.delegatedFrom, delegatedFrom);
      expect(inviteAt.xParams.first.name, name);
      expect(inviteAt.xParams.first.value, value);

      final inviteAlarm = inviteComponent.alarms.first;
      expect(inviteAlarm.action, AlarmAction.display);
      expect(inviteAlarm.description, description);
      expect(inviteAlarm.summary, summary);
      expect(inviteAlarm.attach!.uri, uri);
      expect(inviteAlarm.attach!.contentType, contentType);
      expect(inviteAlarm.attach!.binaryB64Data, binaryB64Data);

      final inviteAlarmAt = inviteAlarm.attendees.first;
      expect(inviteAlarmAt.address, address);
      expect(inviteAlarmAt.url, url);
      expect(inviteAlarmAt.displayName, displayName);
      expect(inviteAlarmAt.sentBy, sentBy);
      expect(inviteAlarmAt.dir, dir);
      expect(inviteAlarmAt.language, language);
      expect(inviteAlarmAt.cuType, cuType);
      expect(inviteAlarmAt.role, role);
      expect(inviteAlarmAt.partStat, partStat);
      expect(inviteAlarmAt.rsvp, rsvp);
      expect(inviteAlarmAt.member, member);
      expect(inviteAlarmAt.delegatedTo, delegatedTo);
      expect(inviteAlarmAt.delegatedFrom, delegatedFrom);
      expect(inviteAlarmAt.xParams.first.name, name);
      expect(inviteAlarmAt.xParams.first.value, value);

      final inviteAlarmXProp = inviteAlarm.xProps.first;
      expect(inviteAlarmXProp.name, name);
      expect(inviteAlarmXProp.value, value);
      expect(inviteAlarmXProp.xParams.first.name, name);
      expect(inviteAlarmXProp.xParams.first.value, value);

      final inviteXProp = inviteComponent.xProps.first;
      expect(inviteXProp.name, name);
      expect(inviteXProp.value, value);
      expect(inviteXProp.xParams.first.name, name);
      expect(inviteXProp.xParams.first.value, value);

      final inviteOrganizer = inviteComponent.organizer!;
      expect(inviteOrganizer.address, address);
      expect(inviteOrganizer.url, url);
      expect(inviteOrganizer.displayName, displayName);
      expect(inviteOrganizer.sentBy, sentBy);
      expect(inviteOrganizer.dir, dir);
      expect(inviteOrganizer.language, language);
      expect(inviteOrganizer.xParams.first.name, name);
      expect(inviteOrganizer.xParams.first.value, value);

      final inviteRecurrence = inviteComponent.recurrence!;
      expect(inviteRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(inviteRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final inviteExcept = inviteRecurrence.except.first;
      expect(inviteExcept.recurrenceRangeType, recurrenceRangeType);
      expect(inviteExcept.recurrenceId, recurrenceId);
      expect(inviteExcept.timezone, timezone);
      expect(inviteExcept.recurIdZ, recurIdZ);
      expect(inviteExcept.add, isA<RecurrenceInfo>());
      expect(inviteExcept.exclude, isA<RecurrenceInfo>());

      final inviteCancel = inviteRecurrence.cancel.first;
      expect(inviteCancel.recurrenceRangeType, recurrenceRangeType);
      expect(inviteCancel.recurrenceId, recurrenceId);
      expect(inviteCancel.timezone, timezone);
      expect(inviteCancel.recurIdZ, recurIdZ);

      final inviteDates = inviteRecurrence.dates.first;
      expect(inviteDates.timezone, timezone);

      final inviteStartTime = inviteDates.dtVals.first.startTime!;
      expect(inviteStartTime.dateTime, dateTimeString);
      expect(inviteStartTime.timezone, timezone);
      expect(inviteStartTime.utcTime, utcTime);

      final inviteEndTime = inviteDates.dtVals.first.endTime!;
      expect(inviteEndTime.dateTime, dateTimeString);
      expect(inviteEndTime.timezone, timezone);
      expect(inviteEndTime.utcTime, utcTime);

      final dtDuration = inviteDates.dtVals.first.duration!;
      expect(dtDuration.durationNegative, durationNegative);
      expect(dtDuration.weeks, weeks);
      expect(dtDuration.days, days);
      expect(dtDuration.hours, hours);
      expect(dtDuration.minutes, minutes);
      expect(dtDuration.seconds, seconds);
      expect(dtDuration.related, AlarmRelated.start);
      expect(dtDuration.repeatCount, repeatCount);

      final inviteSimple = inviteRecurrence.simple.first;
      expect(inviteSimple.until!.dateTime, dateTimeString);
      expect(inviteSimple.count!.num, num);
      expect(inviteSimple.interval!.ival, ival);
      expect(inviteSimple.bySecond!.list, list);
      expect(inviteSimple.byMinute!.list, list);
      expect(inviteSimple.byHour!.list, list);
      expect(inviteSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(inviteSimple.byDay!.days.first.ordWk, ordWk);
      expect(inviteSimple.byMonthDay!.list, list);
      expect(inviteSimple.byYearDay!.list, list);
      expect(inviteSimple.byWeekNo!.list, list);
      expect(inviteSimple.byMonth!.list, list);
      expect(inviteSimple.bySetPose!.list, list);
      expect(inviteSimple.weekStart!.day, WeekDay.sunday);
      expect(inviteSimple.xNames.first.name, name);
      expect(inviteSimple.xNames.first.value, value);

      final inviteExceptionId = inviteComponent.exceptionId!;
      expect(inviteExceptionId.dateTime, dateTimeString);
      expect(inviteExceptionId.timezone, timezone);
      expect(inviteExceptionId.recurrenceRangeType, recurrenceRangeType);

      final inviteDtStart = inviteComponent.dtStart!;
      expect(inviteDtStart.dateTime, dateTimeString);
      expect(inviteDtStart.timezone, timezone);
      expect(inviteDtStart.utcTime, utcTime);

      final inviteDtEnd = inviteComponent.dtEnd!;
      expect(inviteDtEnd.dateTime, dateTimeString);
      expect(inviteDtEnd.timezone, timezone);
      expect(inviteDtEnd.utcTime, utcTime);

      final inviteDuration = inviteComponent.duration!;
      expect(inviteDuration.durationNegative, durationNegative);
      expect(inviteDuration.weeks, weeks);
      expect(inviteDuration.days, days);
      expect(inviteDuration.hours, hours);
      expect(inviteDuration.minutes, minutes);
      expect(inviteDuration.seconds, seconds);
      expect(inviteDuration.related, AlarmRelated.start);
      expect(inviteDuration.repeatCount, repeatCount);
    }));
  }));
}
