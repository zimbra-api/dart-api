// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/filter_condition.dart';

import 'address_book_test.dart';
import 'address_test.dart';
import 'attachment_test.dart';
import 'body_test.dart';
import 'bulk_test.dart';
import 'community_connections_test.dart';
import 'community_content_test.dart';
import 'community_requests_test.dart';
import 'contact_ranking_test.dart';
import 'conversation_test.dart';
import 'current_day_of_week_test.dart';
import 'current_time_test.dart';
import 'date_test.dart';
import 'envelope_test.dart';
import 'facebook_test.dart';
import 'flagged_test.dart';
import 'header_exists_test.dart';
import 'header_test.dart';
import 'importance_test.dart';
import 'invite_test.dart';
import 'linkedin_test.dart';
import 'list_test.dart';
import 'me_test.dart';
import 'mime_header_test.dart';
import 'size_test.dart';
import 'socialcast_test.dart';
import 'true_test.dart';
import 'twitter_test.dart';

class FilterTests {
  /// Condition - allof|anyof
  final FilterCondition condition;

  /// Address book filter tests
  final List<AddressBookTest> addressBookTests;

  /// Address filter tests
  final List<AddressTest> addressTests;

  /// Envelope filter tests
  final List<EnvelopeTest> envelopeTests;

  /// Attachment filter tests
  final List<AttachmentTest> attachmentTests;

  /// Body filter tests
  final List<BodyTest> bodyTests;

  /// Bulk filter tests
  final List<BulkTest> bulkTests;

  /// Contact ranking filter tests
  final List<ContactRankingTest> contactRankingTests;

  /// Conversation filter tests
  final List<ConversationTest> conversationTests;

  /// Current day of week filter tests
  final List<CurrentDayOfWeekTest> currentDayOfWeekTests;

  /// Current time filter tests
  final List<CurrentTimeTest> currentTimeTests;

  /// Date filter tests
  final List<DateTest> dateTests;

  /// Facebook filter tests
  final List<FacebookTest> facebookTests;

  /// Flagged filter tests
  final List<FlaggedTest> flaggedTests;

  /// Header exists filter tests
  final List<HeaderExistsTest> headerExistsTests;

  /// Header filter tests
  final List<HeaderTest> headerTests;

  /// Importance filter tests
  final List<ImportanceTest> importanceTests;

  /// Invite filter tests
  final List<InviteTest> inviteTests;

  /// LinkedIn filter tests
  final List<LinkedInTest> linkedinTests;

  /// List filter tests
  final List<ListTest> listTests;

  /// Me filter tests
  final List<MeTest> meTests;

  /// Mime header filter tests
  final List<MimeHeaderTest> mimeHeaderTests;

  /// Size filter tests
  final List<SizeTest> sizeTests;

  /// Socialcast filter tests
  final List<SocialcastTest> socialcastTests;

  /// True filter tests
  final List<TrueTest> trueTests;

  /// Twitter filter tests
  final List<TwitterTest> twitterTests;

  /// Community requests filter tests
  final List<CommunityRequestsTest> communityRequestsTests;

  /// Community content filter tests
  final List<CommunityContentTest> communityContentTests;

  /// Community connections filter tests
  final List<CommunityConnectionsTest> communityConnectionsTests;

  FilterTests(
      {this.condition = FilterCondition.allof,
      this.addressBookTests = const [],
      this.addressTests = const [],
      this.envelopeTests = const [],
      this.attachmentTests = const [],
      this.bodyTests = const [],
      this.bulkTests = const [],
      this.contactRankingTests = const [],
      this.conversationTests = const [],
      this.currentDayOfWeekTests = const [],
      this.currentTimeTests = const [],
      this.dateTests = const [],
      this.facebookTests = const [],
      this.flaggedTests = const [],
      this.headerExistsTests = const [],
      this.headerTests = const [],
      this.importanceTests = const [],
      this.inviteTests = const [],
      this.linkedinTests = const [],
      this.listTests = const [],
      this.meTests = const [],
      this.mimeHeaderTests = const [],
      this.sizeTests = const [],
      this.socialcastTests = const [],
      this.trueTests = const [],
      this.twitterTests = const [],
      this.communityRequestsTests = const [],
      this.communityContentTests = const [],
      this.communityConnectionsTests = const []});

  factory FilterTests.fromMap(Map<String, dynamic> data) => FilterTests(
        condition: FilterCondition.values.firstWhere(
          (condition) => condition.name == data['condition'],
          orElse: () => FilterCondition.allof,
        ),
        addressBookTests: data['addressBookTest'] is Iterable
            ? (data['addressBookTest'] as Iterable)
                .map<AddressBookTest>((test) => AddressBookTest.fromMap(test))
                .toList(growable: false)
            : const [],
        addressTests: data['addressTest'] is Iterable
            ? (data['addressTest'] as Iterable)
                .map<AddressTest>((test) => AddressTest.fromMap(test))
                .toList(growable: false)
            : const [],
        envelopeTests: data['envelopeTest'] is Iterable
            ? (data['envelopeTest'] as Iterable)
                .map<EnvelopeTest>((test) => EnvelopeTest.fromMap(test))
                .toList(growable: false)
            : const [],
        attachmentTests: data['attachmentTest'] is Iterable
            ? (data['attachmentTest'] as Iterable)
                .map<AttachmentTest>((test) => AttachmentTest.fromMap(test))
                .toList(growable: false)
            : const [],
        bodyTests: data['bodyTest'] is Iterable
            ? (data['bodyTest'] as Iterable).map<BodyTest>((test) => BodyTest.fromMap(test)).toList(growable: false)
            : const [],
        bulkTests: data['bulkTest'] is Iterable
            ? (data['bulkTest'] as Iterable).map<BulkTest>((test) => BulkTest.fromMap(test)).toList(growable: false)
            : const [],
        contactRankingTests: data['contactRankingTest'] is Iterable
            ? (data['contactRankingTest'] as Iterable)
                .map<ContactRankingTest>((test) => ContactRankingTest.fromMap(test))
                .toList(growable: false)
            : const [],
        conversationTests: data['conversationTest'] is Iterable
            ? (data['conversationTest'] as Iterable)
                .map<ConversationTest>((test) => ConversationTest.fromMap(test))
                .toList(growable: false)
            : const [],
        currentDayOfWeekTests: data['currentDayOfWeekTest'] is Iterable
            ? (data['currentDayOfWeekTest'] as Iterable)
                .map<CurrentDayOfWeekTest>((test) => CurrentDayOfWeekTest.fromMap(test))
                .toList(growable: false)
            : const [],
        currentTimeTests: data['currentTimeTest'] is Iterable
            ? (data['currentTimeTest'] as Iterable)
                .map<CurrentTimeTest>((test) => CurrentTimeTest.fromMap(test))
                .toList(growable: false)
            : const [],
        dateTests: data['dateTest'] is Iterable
            ? (data['dateTest'] as Iterable).map<DateTest>((test) => DateTest.fromMap(test)).toList(growable: false)
            : const [],
        facebookTests: data['facebookTest'] is Iterable
            ? (data['facebookTest'] as Iterable)
                .map<FacebookTest>((test) => FacebookTest.fromMap(test))
                .toList(growable: false)
            : const [],
        flaggedTests: data['flaggedTest'] is Iterable
            ? (data['flaggedTest'] as Iterable)
                .map<FlaggedTest>((test) => FlaggedTest.fromMap(test))
                .toList(growable: false)
            : const [],
        headerExistsTests: data['headerExistsTest'] is Iterable
            ? (data['headerExistsTest'] as Iterable)
                .map<HeaderExistsTest>((test) => HeaderExistsTest.fromMap(test))
                .toList(growable: false)
            : const [],
        headerTests: data['headerTest'] is Iterable
            ? (data['headerTest'] as Iterable)
                .map<HeaderTest>((test) => HeaderTest.fromMap(test))
                .toList(growable: false)
            : const [],
        importanceTests: data['importanceTest'] is Iterable
            ? (data['importanceTest'] as Iterable)
                .map<ImportanceTest>((test) => ImportanceTest.fromMap(test))
                .toList(growable: false)
            : const [],
        inviteTests: data['inviteTest'] is Iterable
            ? (data['inviteTest'] as Iterable)
                .map<InviteTest>((test) => InviteTest.fromMap(test))
                .toList(growable: false)
            : const [],
        linkedinTests: data['linkedinTest'] is Iterable
            ? (data['linkedinTest'] as Iterable)
                .map<LinkedInTest>((test) => LinkedInTest.fromMap(test))
                .toList(growable: false)
            : const [],
        listTests: data['listTest'] is Iterable
            ? (data['listTest'] as Iterable).map<ListTest>((test) => ListTest.fromMap(test)).toList(growable: false)
            : const [],
        meTests: data['meTest'] is Iterable
            ? (data['meTest'] as Iterable).map<MeTest>((test) => MeTest.fromMap(test)).toList(growable: false)
            : const [],
        mimeHeaderTests: data['mimeHeaderTest'] is Iterable
            ? (data['mimeHeaderTest'] as Iterable)
                .map<MimeHeaderTest>((test) => MimeHeaderTest.fromMap(test))
                .toList(growable: false)
            : const [],
        sizeTests: data['sizeTest'] is Iterable
            ? (data['sizeTest'] as Iterable).map<SizeTest>((test) => SizeTest.fromMap(test)).toList(growable: false)
            : const [],
        socialcastTests: data['socialcastTest'] is Iterable
            ? (data['socialcastTest'] as Iterable)
                .map<SocialcastTest>((test) => SocialcastTest.fromMap(test))
                .toList(growable: false)
            : const [],
        trueTests: data['trueTest'] is Iterable
            ? (data['trueTest'] as Iterable).map<TrueTest>((test) => TrueTest.fromMap(test)).toList(growable: false)
            : const [],
        twitterTests: data['twitterTest'] is Iterable
            ? (data['twitterTest'] as Iterable)
                .map<TwitterTest>((test) => TwitterTest.fromMap(test))
                .toList(growable: false)
            : const [],
        communityRequestsTests: data['communityRequestsTest'] is Iterable
            ? (data['communityRequestsTest'] as Iterable)
                .map<CommunityRequestsTest>((test) => CommunityRequestsTest.fromMap(test))
                .toList(growable: false)
            : const [],
        communityContentTests: data['communityContentTest'] is Iterable
            ? (data['communityContentTest'] as Iterable)
                .map<CommunityContentTest>((test) => CommunityContentTest.fromMap(test))
                .toList(growable: false)
            : const [],
        communityConnectionsTests: data['communityConnectionsTest'] is Iterable
            ? (data['communityConnectionsTest'] as Iterable)
                .map<CommunityConnectionsTest>((test) => CommunityConnectionsTest.fromMap(test))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'condition': condition.name,
        if (addressBookTests.isNotEmpty)
          'addressBookTest': addressBookTests.map((test) => test.toMap()).toList(growable: false),
        if (addressTests.isNotEmpty) 'addressTest': addressTests.map((test) => test.toMap()).toList(growable: false),
        if (envelopeTests.isNotEmpty) 'envelopeTest': envelopeTests.map((test) => test.toMap()).toList(growable: false),
        if (attachmentTests.isNotEmpty)
          'attachmentTest': attachmentTests.map((test) => test.toMap()).toList(growable: false),
        if (bodyTests.isNotEmpty) 'bodyTest': bodyTests.map((test) => test.toMap()).toList(growable: false),
        if (bulkTests.isNotEmpty) 'bulkTest': bulkTests.map((test) => test.toMap()).toList(growable: false),
        if (contactRankingTests.isNotEmpty)
          'contactRankingTest': contactRankingTests.map((test) => test.toMap()).toList(growable: false),
        if (conversationTests.isNotEmpty)
          'conversationTest': conversationTests.map((test) => test.toMap()).toList(growable: false),
        if (currentDayOfWeekTests.isNotEmpty)
          'currentDayOfWeekTest': currentDayOfWeekTests.map((test) => test.toMap()).toList(growable: false),
        if (currentTimeTests.isNotEmpty)
          'currentTimeTest': currentTimeTests.map((test) => test.toMap()).toList(growable: false),
        if (dateTests.isNotEmpty) 'dateTest': dateTests.map((test) => test.toMap()).toList(growable: false),
        if (facebookTests.isNotEmpty) 'facebookTest': facebookTests.map((test) => test.toMap()).toList(growable: false),
        if (flaggedTests.isNotEmpty) 'flaggedTest': flaggedTests.map((test) => test.toMap()).toList(growable: false),
        if (headerExistsTests.isNotEmpty)
          'headerExistsTest': headerExistsTests.map((test) => test.toMap()).toList(growable: false),
        if (headerTests.isNotEmpty) 'headerTest': headerTests.map((test) => test.toMap()).toList(growable: false),
        if (importanceTests.isNotEmpty)
          'importanceTest': importanceTests.map((test) => test.toMap()).toList(growable: false),
        if (inviteTests.isNotEmpty) 'inviteTest': inviteTests.map((test) => test.toMap()).toList(growable: false),
        if (linkedinTests.isNotEmpty) 'linkedinTest': linkedinTests.map((test) => test.toMap()).toList(growable: false),
        if (listTests.isNotEmpty) 'listTest': listTests.map((test) => test.toMap()).toList(growable: false),
        if (meTests.isNotEmpty) 'meTest': meTests.map((test) => test.toMap()).toList(growable: false),
        if (mimeHeaderTests.isNotEmpty)
          'mimeHeaderTest': mimeHeaderTests.map((test) => test.toMap()).toList(growable: false),
        if (sizeTests.isNotEmpty) 'sizeTest': sizeTests.map((test) => test.toMap()).toList(growable: false),
        if (socialcastTests.isNotEmpty)
          'socialcastTest': socialcastTests.map((test) => test.toMap()).toList(growable: false),
        if (trueTests.isNotEmpty) 'trueTest': trueTests.map((test) => test.toMap()).toList(growable: false),
        if (twitterTests.isNotEmpty) 'twitterTest': twitterTests.map((test) => test.toMap()).toList(growable: false),
        if (communityRequestsTests.isNotEmpty)
          'communityRequestsTest': communityRequestsTests.map((test) => test.toMap()).toList(growable: false),
        if (communityContentTests.isNotEmpty)
          'communityContentTest': communityContentTests.map((test) => test.toMap()).toList(growable: false),
        if (communityConnectionsTests.isNotEmpty)
          'communityConnectionsTest': communityConnectionsTests.map((test) => test.toMap()).toList(growable: false),
      };
}
