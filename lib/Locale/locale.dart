import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/globals.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/kurdish.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tk': turkish(),
    'sw': swahili(),
    'it': italian(),
    'fa': kurdish(),
  };

  String? get trainingCourses {
    return _localizedValues[locale.languageCode]!['trainingCourses'];
  }
  String? get mostWanted {
    return _localizedValues[locale.languageCode]!['mostWanted'];
  }

  String? get coursesInManagementAndMarketing {
    return _localizedValues[locale.languageCode]!['coursesInManagementAndMarketing'];
  }

  String? get diplomasAndPackages {
    return _localizedValues[locale.languageCode]!['diplomasAndPackages'];
  }

  String? get signIn {
    return _localizedValues[locale.languageCode]!['signIn'];
  }
  String? get email {
    return _localizedValues[locale.languageCode]!['email'];
  }

  String? get enterTheEmail {
    return _localizedValues[locale.languageCode]!['enterTheEmail'];
  }

  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }

  String? get enterThePassword {
    return _localizedValues[locale.languageCode]!['enterThePassword'];
  }

  String? get iForgotThePassword {
    return _localizedValues[locale.languageCode]!['iForgotThePassword'];
  }

  String? get orSignIn {
    return _localizedValues[locale.languageCode]!['orSignIn'];
  }

  String? get iDoNotHaveAnAccount {
    return _localizedValues[locale.languageCode]!['iDoNotHaveAnAccount'];
  }

  String? get newSubscription {
    return _localizedValues[locale.languageCode]!['newSubscription'];
  }

  String? get onceYouAreRegisteredInTheApplicationYouAgreeTo {
    return _localizedValues[locale.languageCode]!['onceYouAreRegisteredInTheApplicationYouAgreeTo'];
  }

  String? get privacyPolicyAndTermsOfUse {
    return _localizedValues[locale.languageCode]!['privacyPolicyAndTermsOfUse'];
  }
  String? get bookYourConsultationWithTheExperts {
    return _localizedValues[locale.languageCode]!['bookYourConsultationWithTheExperts'];
  }

  String? get categories {
    return _localizedValues[locale.languageCode]!['categories'];
  }

  String? get coursePrice {
    return _localizedValues[locale.languageCode]!['coursePrice'];
  }

  String? get buyNow {
    return _localizedValues[locale.languageCode]!['buyNow'];
  }

  String? get commonQuestions {
    return _localizedValues[locale.languageCode]!['commonQuestions'];
  }
  String? get courseContent {
    return _localizedValues[locale.languageCode]!['courseContent'];
  }
  String? get courseOverview {
    return _localizedValues[locale.languageCode]!['courseOverview'];
  }
  String? get marketingCoach {
    return _localizedValues[locale.languageCode]!['marketingCoach'];
  }

  String? get pricesAndPayment {
    return _localizedValues[locale.languageCode]!['pricesAndPayment'];
  }

  String? get generalQuestions {
    return _localizedValues[locale.languageCode]!['generalQuestions'];
  }

  String? get partOne {
    return _localizedValues[locale.languageCode]!['partOne'];
  }
  String? get minute {
    return _localizedValues[locale.languageCode]!['minute'];
  }

  String? get hour {
    return _localizedValues[locale.languageCode]!['hour'];
  }

  String? get tutorials {
    return _localizedValues[locale.languageCode]!['tutorials'];
  }
  String? get courseCoach {
    return _localizedValues[locale.languageCode]!['courseCoach'];
  }

  String? get conditionsForObtainingTheCertificate {
    return _localizedValues[locale.languageCode]!['conditionsForObtainingTheCertificate'];
  }

  String? get courseObjectives {
    return _localizedValues[locale.languageCode]!['courseObjectives'];
  }
  String? get courseDescription {
    return _localizedValues[locale.languageCode]!['courseDescription'];
  }
  String? get showMore {
    return _localizedValues[locale.languageCode]!['showMore'];
  }
  String? get hide {
    return _localizedValues[locale.languageCode]!['hide'];
  }

  String? get second {
    return _localizedValues[locale.languageCode]!['second'];
  }
  String? get videoDuration {
    return _localizedValues[locale.languageCode]!['videoDuration'];
  }
  String? get annualSubscription {
    return _localizedValues[locale.languageCode]!['annualSubscription'];
  }
  String? get trainingCertificate {
    return _localizedValues[locale.languageCode]!['trainingCertificate'];
  }
  String? get attendanceOfAtLeast {
    return _localizedValues[locale.languageCode]!['attendanceOfAtLeast'];
  }
  String? get handingInAssignmentsAndProjects {
    return _localizedValues[locale.languageCode]!['handingInAssignmentsAndProjects'];
  }
  String? get parts {
    return _localizedValues[locale.languageCode]!['parts'];
  }
  String? get eachPartContainsASetOfLessons {
    return _localizedValues[locale.languageCode]!['eachPartContainsASetOfLessons'];
  }
  String? get h {
    return _localizedValues[locale.languageCode]!['h'];
  }
  String? get m {
    return _localizedValues[locale.languageCode]!['m'];
  }
  String? get s {
    return _localizedValues[locale.languageCode]!['s'];
  }

  String? get coaches {
    return _localizedValues[locale.languageCode]!['coaches'];
  }
  String? get diploma {
    return _localizedValues[locale.languageCode]!['diploma'];
  }
  String? get packages {
    return _localizedValues[locale.languageCode]!['packages'];
  }
  String? get new_ {
    return _localizedValues[locale.languageCode]!['new'];
  }
  String? get june {
    return _localizedValues[locale.languageCode]!['june'];
  }
  String? get main {
    return _localizedValues[locale.languageCode]!['main'];
  }
  String? get favorite {
    return _localizedValues[locale.languageCode]!['favorite'];
  }

  String? get myCourses {
    return _localizedValues[locale.languageCode]!['myCourses'];
  }
  String? get myConsultation {
    return _localizedValues[locale.languageCode]!['myConsultation'];
  }
  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get course {
    return _localizedValues[locale.languageCode]!['course'];
  }
  String? get current {
    return _localizedValues[locale.languageCode]!['course'];
  }
  String? get completed {
    return _localizedValues[locale.languageCode]!['completed'];
  }
  String? get certificates {
    return _localizedValues[locale.languageCode]!['certificates'];
  }
  String? get courses {
    return _localizedValues[locale.languageCode]!['courses'];
  }

  String? get seconds {
    return _localizedValues[locale.languageCode]!['seconds'];
  }
  String? get courseCompletionRate {
    return _localizedValues[locale.languageCode]!['courseCompletionRate'];
  }
  String? get meeting {
    return _localizedValues[locale.languageCode]!['meeting'];
  }

  String? get broadcastLive {
    return _localizedValues[locale.languageCode]!['broadcastLive'];
  }
  String? get and {
    return _localizedValues[locale.languageCode]!['and'];
  }

  String? get rated {
    return _localizedValues[locale.languageCode]!['rated'];
  }
  String? get currentConsultation {
    return _localizedValues[locale.languageCode]!['currentConsultation'];
  }
  String? get yourConsultationNumber {
    return _localizedValues[locale.languageCode]!['yourConsultationNumber'];
  }

  String? get twoWeeks {
    return _localizedValues[locale.languageCode]!['twoWeeks'];
  }
  String? get sessionsFor {
    return _localizedValues[locale.languageCode]!['sessionsFor'];
  }
  String? get sessionsLeft {
    return _localizedValues[locale.languageCode]!['sessionsLeft'];
  }
  String? get forUpcomingConsultations {
    return _localizedValues[locale.languageCode]!['forUpcomingConsultations'];
  }
  String? get bookNow {
    return _localizedValues[locale.languageCode]!['bookNow'];
  }
  String? get lessons {
    return _localizedValues[locale.languageCode]!['lessons'];
  }
  String? get exams {
    return _localizedValues[locale.languageCode]!['exams'];
  }
  String? get activities {
    return _localizedValues[locale.languageCode]!['activities'];
  }
  String? get notes {
    return _localizedValues[locale.languageCode]!['notes'];
  }
  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }
  String? get discussions {
    return _localizedValues[locale.languageCode]!['discussions'];
  }
  String? get terminology {
    return _localizedValues[locale.languageCode]!['terminology'];
  }

  String? get freeEncyclopedia {
    return _localizedValues[locale.languageCode]!['freeEncyclopedia'];
  }
  String? get ads {
    return _localizedValues[locale.languageCode]!['ads'];
  }

  String? get test {
    return _localizedValues[locale.languageCode]!['test'];
  }
  String? get questions {
    return _localizedValues[locale.languageCode]!['questions'];
  }
  String? get degree {
    return _localizedValues[locale.languageCode]!['degree'];
  }
  String? get numberOfAttempts {
    return _localizedValues[locale.languageCode]!['numberOfAttempts'];
  }
  String? get startTheTest {
    return _localizedValues[locale.languageCode]!['startTheTest'];
  }
  String? get activity {
    return _localizedValues[locale.languageCode]!['activity'];
  }
  String? get caseStudy {
    return _localizedValues[locale.languageCode]!['caseStudy'];
  }

  String? get notSent {
    return _localizedValues[locale.languageCode]!['notSent'];
  }
  String? get theSolutionHasBeenSent {
    return _localizedValues[locale.languageCode]!['theSolutionHasBeenSent'];
  }

  String? get chooseTheLesson {
    return _localizedValues[locale.languageCode]!['chooseTheLesson'];
  }
  String? get addANote {
    return _localizedValues[locale.languageCode]!['addANote'];
  }

  String? get writeYourNotes {
    return _localizedValues[locale.languageCode]!['writeYourNotes'];
  }
  String? get saveNotes {
    return _localizedValues[locale.languageCode]!['saveNotes'];
  }
  String? get addNotes {
    return _localizedValues[locale.languageCode]!['addNotes'];
  }

  String? get deleteAll {
    return _localizedValues[locale.languageCode]!['deleteAll'];
  }
  String? get confirmDeletion {
    return _localizedValues[locale.languageCode]!['confirmDeletion'];
  }
  String? get areSureOfTheDeletingProcess {
    return _localizedValues[locale.languageCode]!['areSureOfTheDeletingProcess'];
  }

  String? get noCancelTheDeletion {
    return _localizedValues[locale.languageCode]!['noCancelTheDeletion'];
  }
  String? get yesIWantToDelete {
    return _localizedValues[locale.languageCode]!['yesIWantToDelete'];
  }
  String? get like {
    return _localizedValues[locale.languageCode]!['like'];
  }
  String? get comment {
    return _localizedValues[locale.languageCode]!['comment'];
  }
  String? get addANewTerm {
    return _localizedValues[locale.languageCode]!['addANewTerm'];
  }

  String? get termTitle {
    return _localizedValues[locale.languageCode]!['termTitle'];
  }
  String? get enterTheTitleOfTheTerm {
    return _localizedValues[locale.languageCode]!['enterTheTitleOfTheTerm'];
  }

  String? get definitionOfTheTerm {
    return _localizedValues[locale.languageCode]!['definitionOfTheTerm'];
  }
  String? get enterTheDefinition {
    return _localizedValues[locale.languageCode]!['enterTheDefinition'];
  }
  String? get topics {
    return _localizedValues[locale.languageCode]!['topics'];
  }
  String? get addANewArticle {
    return _localizedValues[locale.languageCode]!['addANewArticle'];
  }

  String? get enterTheTextOfTheArticle {
    return _localizedValues[locale.languageCode]!['enterTheTextOfTheArticle'];
  }

  String? get since {
    return _localizedValues[locale.languageCode]!['since'];
  }
  String? get extension {
    return _localizedValues[locale.languageCode]!['extension'];
  }

  String? get coach {
    return _localizedValues[locale.languageCode]!['coach'];
  }

  String? get show {
    return _localizedValues[locale.languageCode]!['show'];
  }
  String? get download {
    return _localizedValues[locale.languageCode]!['download'];
  }

  String? get share {
    return _localizedValues[locale.languageCode]!['share'];
  }

  String? get tests {
    return _localizedValues[locale.languageCode]!['tests'];
  }

  String? get welcome {
    return _localizedValues[locale.languageCode]!['welcome'];
  }
  String? get personalAdvice {
    return _localizedValues[locale.languageCode]!['personalAdvice'];
  }
  String? get myInfo {
    return _localizedValues[locale.languageCode]!['myInfo'];
  }
  String? get myInfoEvent {
    return _localizedValues[locale.languageCode]!['myInfoEvent'];
  }
  String? get notifications {
    return _localizedValues[locale.languageCode]!['notifications'];
  }
  String? get notificationsEvent {
    return _localizedValues[locale.languageCode]!['notificationsEvent'];
  }
  String? get performanceQuality {
    return _localizedValues[locale.languageCode]!['performanceQuality'];
  }
  String? get performanceQualityEvent {
    return _localizedValues[locale.languageCode]!['performanceQualityEvent'];
  }
  String? get safety {
    return _localizedValues[locale.languageCode]!['safety'];
  }
  String? get safetyEvent {
    return _localizedValues[locale.languageCode]!['safetyEvent'];
  }
  String? get downloads {
    return _localizedValues[locale.languageCode]!['downloads'];
  }
  String? get downloadsEvent {
    return _localizedValues[locale.languageCode]!['downloadsEvent'];
  }
  String? get applicationSettings {
    return _localizedValues[locale.languageCode]!['applicationSettings'];
  }

  String? get applicationSettingsEvent {
    return _localizedValues[locale.languageCode]!['applicationSettingsEvent'];
  }

  String? get help {
    return _localizedValues[locale.languageCode]!['help'];
  }
  String? get helpEvent {
    return _localizedValues[locale.languageCode]!['helpEvent'];
  }
  String? get shareTheApp {
    return _localizedValues[locale.languageCode]!['shareTheApp'];
  }
  String? get shareTheAppEvent {
    return _localizedValues[locale.languageCode]!['shareTheAppEvent'];
  }
  String? get logOut {
    return _localizedValues[locale.languageCode]!['logOut'];
  }

  String? get appVersion {
    return _localizedValues[locale.languageCode]!['appVersion'];
  }
  String? get checkoutConfirmation {
    return _localizedValues[locale.languageCode]!['checkoutConfirmation'];
  }
  String? get areYouSureYouAreLoggedOut {
    return _localizedValues[locale.languageCode]!['areYouSureYouAreLoggedOut'];
  }
  String? get cancel {
    return _localizedValues[locale.languageCode]!['cancel'];
  }
  String? get myAccount {
    return _localizedValues[locale.languageCode]!['myAccount'];
  }

  String? get editPersonalInformation {
    return _localizedValues[locale.languageCode]!['editPersonalInformation'];
  }
  String? get createANewPassword {
    return _localizedValues[locale.languageCode]!['createANewPassword'];
  }
  String? get paymentCards {
    return _localizedValues[locale.languageCode]!['paymentCards'];
  }
  String? get purchaseInvoice {
    return _localizedValues[locale.languageCode]!['purchaseInvoice'];
  }
  String? get deleteAccount {
    return _localizedValues[locale.languageCode]!['deleteAccount'];
  }

  String? get name {
    return _localizedValues[locale.languageCode]!['name'];
  }

  String? get mobileNumber {
    return _localizedValues[locale.languageCode]!['mobileNumber'];
  }

  String? get country {
    return _localizedValues[locale.languageCode]!['country'];
  }
  String? get updateMyDetails {
    return _localizedValues[locale.languageCode]!['updateMyDetails'];
  }

  String? get pleaseEnterThePasswordTwice {
    return _localizedValues[locale.languageCode]!['pleaseEnterThePasswordTwice'];
  }
  String? get largeLetters {
    return _localizedValues[locale.languageCode]!['largeLetters'];
  }

  String? get smallLetters {
    return _localizedValues[locale.languageCode]!['smallLetters'];
  }

  String? get numbers {
    return _localizedValues[locale.languageCode]!['numbers'];
  }

  String? get withoutSymbols {
    return _localizedValues[locale.languageCode]!['withoutSymbols'];
  }
  String? get newPassword {
    return _localizedValues[locale.languageCode]!['newPassword'];
  }
  String? get enterNewPassword {
    return _localizedValues[locale.languageCode]!['enterNewPassword'];
  }
  String? get confirmNewPassword {
    return _localizedValues[locale.languageCode]!['confirmNewPassword'];
  }

  String? get paymentMeans {
    return _localizedValues[locale.languageCode]!['paymentMeans'];
  }

  String? get virtualPaymentCard {
    return _localizedValues[locale.languageCode]!['paymentMeans'];
  }
  String? get dialNumber {
    return _localizedValues[locale.languageCode]!['paymentMeans'];
  }
  String? get basicsOfMarkerDrawing {
    return _localizedValues[locale.languageCode]!['basicsOfMarkerDrawing'];
  }

  String? get paid {
    return _localizedValues[locale.languageCode]!['paid'];
  }

  String? get whenTheAccountIsDeletedItWillBe {
    return _localizedValues[locale.languageCode]!['whenTheAccountIsDeletedItWillBe'];
  }
  String? get logoutAllDevices {
    return _localizedValues[locale.languageCode]!['logoutAllDevices'];
  }
  String? get deleteAllAccountData {
    return _localizedValues[locale.languageCode]!['deleteAllAccountData'];
  }

  String? get theAccountCannotBeRestoredAgain {
    return _localizedValues[locale.languageCode]!['theAccountCannotBeRestoredAgain'];
  }

  String? get pleaseWhatAreTheReasonsRorYourAccountDeletion {
    return _localizedValues[locale.languageCode]!['pleaseWhatAreTheReasonsRorYourAccountDeletion'];
  }
  String? get iDoNotWantTheAccountAnymore {
    return _localizedValues[locale.languageCode]!['iDoNotWantTheAccountAnymore'];
  }
  String? get iDidNotBenefitFromTheTrainingProgramme {
    return _localizedValues[locale.languageCode]!['iDidNotBenefitFromTheTrainingProgramme'];
  }
  String? get coursesAreTooExpensive {
    return _localizedValues[locale.languageCode]!['coursesAreTooExpensive'];
  }
  String? get iHaveAnotherAccount {
    return _localizedValues[locale.languageCode]!['iHaveAnotherAccount'];
  }
  String? get other {
    return _localizedValues[locale.languageCode]!['other'];
  }
  String? get giveTheReasonsForDeletingTheAccount {
    return _localizedValues[locale.languageCode]!['giveTheReasonsForDeletingTheAccount'];
  }
  String? get confirmAccountDeletion {
    return _localizedValues[locale.languageCode]!['confirmAccountDeletion'];
  }

  String? get emailNotifications {
    return _localizedValues[locale.languageCode]!['emailNotifications'];
  }
  String? get trainingCoursesOffersPercentageOfProgressInTraining {
    return _localizedValues[locale.languageCode]!['trainingCoursesOffersPercentageOfProgressInTraining'];
  }
  String? get advertisementsReceivedFromTheTrainer {
    return _localizedValues[locale.languageCode]!['advertisementsReceivedFromTheTrainer'];
  }
  String? get backgroundNotifications {
    return _localizedValues[locale.languageCode]!['backgroundNotifications'];
  }
  String? get currentCoursesYourProgressInLearning {
    return _localizedValues[locale.languageCode]!['currentCoursesYourProgressInLearning'];
  }
  String? get remindYouToStudyAndLearn {
    return _localizedValues[locale.languageCode]!['remindYouToStudyAndLearn'];
  }
  String? get chooseTheReminderTime {
    return _localizedValues[locale.languageCode]!['chooseTheReminderTime'];
  }

  String? get playTheAudioOfTheVideoInTheBackground {
    return _localizedValues[locale.languageCode]!['playTheAudioOfTheVideoInTheBackground'];
  }
  String? get autoplayContent {
    return _localizedValues[locale.languageCode]!['autoplayContent'];
  }
  String? get moveToNextContent {
    return _localizedValues[locale.languageCode]!['moveToNextContent'];
  }
  String? get increaseFont {
    return _localizedValues[locale.languageCode]!['increaseFont'];
  }
  String? get medium {
    return _localizedValues[locale.languageCode]!['medium'];
  }
  String? get previewTheFont {
    return _localizedValues[locale.languageCode]!['previewTheFont'];
  }
  String? get baseAddress {
    return _localizedValues[locale.languageCode]!['baseAddress'];
  }
  String? get subtitle {
    return _localizedValues[locale.languageCode]!['subtitle'];
  }
  String? get downloadQuality {
    return _localizedValues[locale.languageCode]!['downloadQuality'];
  }
  String? get deleteAllDownloads {
    return _localizedValues[locale.languageCode]!['deleteAllDownloads'];
  }
  String? get usedFrom {
    return _localizedValues[locale.languageCode]!['usedFrom'];
  }
  String? get free {
    return _localizedValues[locale.languageCode]!['free'];
  }
  String? get videoDownloadQuality {
    return _localizedValues[locale.languageCode]!['videoDownloadQuality'];
  }

  String? get low {
    return _localizedValues[locale.languageCode]!['low'];
  }
  String? get or {
    return _localizedValues[locale.languageCode]!['or'];
  }

  String? get fasterLoadingAndLessStorage {
    return _localizedValues[locale.languageCode]!['fasterLoadingAndLessStorage'];
  }
  String? get loadAndStoreMediumQuality {
    return _localizedValues[locale.languageCode]!['loadAndStoreMediumQuality'];
  }
  String? get high {
    return _localizedValues[locale.languageCode]!['high'];
  }
  String? get slowLoadingAndMoreStorage {
    return _localizedValues[locale.languageCode]!['slowLoadingAndMoreStorage'];
  }
  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }
  String? get nightMode {
    return _localizedValues[locale.languageCode]!['nightMode'];
  }
  String? get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'];
  }

  String? get termsAndConditions {
    return _localizedValues[locale.languageCode]!['termsAndConditions'];
  }

  String? get chooseTheLanguageOfTheApplication {
    return _localizedValues[locale.languageCode]!['chooseTheLanguageOfTheApplication'];
  }
  String? get changeApplicationMode {
    return _localizedValues[locale.languageCode]!['changeApplicationMode'];
  }
  String? get run {
    return _localizedValues[locale.languageCode]!['run'];
  }

  String? get off {
    return _localizedValues[locale.languageCode]!['off'];
  }
  String? get darkMode {
    return _localizedValues[locale.languageCode]!['darkMode'];
  }
  String? get howToWriteAndImplementASalesPlan {
    return _localizedValues[locale.languageCode]!['howToWriteAndImplementASalesPlan'];
  }
  String? get managementAndSmallAndMediumEnterprises {
    return _localizedValues[locale.languageCode]!['managementAndSmallAndMediumEnterprises'];
  }

  String? get dr {
    return _localizedValues[locale.languageCode]!['dr'];
  }
  String? get name_ {
    return _localizedValues[locale.languageCode]!['name_'];
  }
  String? get personalGuidanceProgramInDrawing {
    return _localizedValues[locale.languageCode]!['personalGuidanceProgramInDrawing'];
  }

  String? get salesAndMarketing {
    return _localizedValues[locale.languageCode]!['salesAndMarketing'];
  }

  String? get markerDrawingBasics {
    return _localizedValues[locale.languageCode]!['markerDrawingBasics'];
  }

  String? get mr {
    return _localizedValues[locale.languageCode]!['mr'];
  }

  String? get printedCertificate {
    return _localizedValues[locale.languageCode]!['printedCertificate'];
  }
  String? get understandEcommerce {
    return _localizedValues[locale.languageCode]!['understandEcommerce'];
  }
  String? get text {
    return _localizedValues[locale.languageCode]!['text'];
  }
  String? get financialConcepts {
    return _localizedValues[locale.languageCode]!['financialConcepts'];
  }
  String? get firstLesson {
    return _localizedValues[locale.languageCode]!['firstLesson'];
  }
  String? get academicTermsAndConceptsInPainting {
    return _localizedValues[locale.languageCode]!['academicTermsAndConceptsInPainting'];
  }
  String? get financialStatementsInFinancialAnalysis {
    return _localizedValues[locale.languageCode]!['financialStatementsInFinancialAnalysis'];
  }

  String? get introduction {
    return _localizedValues[locale.languageCode]!['introduction'];
  }

  String? get toContactSupportAt {
    return _localizedValues[locale.languageCode]!['toContactSupportAt'];
  }
  String? get whatIsMasterAcademy {
    return _localizedValues[locale.languageCode]!['whatIsMasterAcademy'];
  }

  String? get mediaDrawingDesign {
    return _localizedValues[locale.languageCode]!['mediaDrawingDesign'];
  }
  String? get markerBasics {
    return _localizedValues[locale.languageCode]!['markerBasics'];
  }
  String? get createANewAccount {
    return _localizedValues[locale.languageCode]!['createANewAccount'];
  }
  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }
  String? get example {
    return _localizedValues[locale.languageCode]!['example'];
  }
  String? get chooseYourCountry {
    return _localizedValues[locale.languageCode]!['chooseYourCountry'];
  }
  String? get mobileNumberOptional {
    return _localizedValues[locale.languageCode]!['mobileNumberOptional'];
  }
  String? get onceYouAreRegistered {
    return _localizedValues[locale.languageCode]!['onceYouAreRegistered'];
  }
  String? get andTermsOfUse {
    return _localizedValues[locale.languageCode]!['andTermsOfUse'];
  }
  String? get systemDefault {
    return _localizedValues[locale.languageCode]!['systemDefault'];
  }
  String? get cardVerification {
    return _localizedValues[locale.languageCode]!['cardVerification'];
  }
  String? get addANewCard {
    return _localizedValues[locale.languageCode]!['addANewCard'];
  }
  String? get keepPaymentInformationConfidential {
    return _localizedValues[locale.languageCode]!['keepPaymentInformationConfidential'];
  }
  String? get cardNumber {
    return _localizedValues[locale.languageCode]!['cardNumber'];
  }
  String? get cardHolderName {
    return _localizedValues[locale.languageCode]!['cardHolderName'];
  }
  String? get enterName {
    return _localizedValues[locale.languageCode]!['enterName'];
  }
  String? get saveAsDefaultCard {
    return _localizedValues[locale.languageCode]!['saveAsDefaultCard'];
  }
  String? get verifyCard {
    return _localizedValues[locale.languageCode]!['verifyCard'];
  }
  String? get confirmPayment {
    return _localizedValues[locale.languageCode]!['confirmPayment'];
  }
  String? get sendProcessCompletedSuccessfully {
    return _localizedValues[locale.languageCode]!['sendProcessCompletedSuccessfully'];
  }
  String? get movementNumber {
    return _localizedValues[locale.languageCode]!['movementNumber'];
  }
  String? get cart {
    return _localizedValues[locale.languageCode]!['cart'];
  }
  String? get discountCoupon {
    return _localizedValues[locale.languageCode]!['discountCoupon'];
  }
  String? get couponNotAvailableAtThisTime {
    return _localizedValues[locale.languageCode]!['couponNotAvailableAtThisTime'];
  }
  String? get price {
    return _localizedValues[locale.languageCode]!['price'];
  }
  String? get discountAmount {
    return _localizedValues[locale.languageCode]!['discountAmount'];
  }
  String? get totalRequest {
    return _localizedValues[locale.languageCode]!['totalRequest'];
  }
  String? get total {
    return _localizedValues[locale.languageCode]!['total'];
  }
  String? get all {
    return _localizedValues[locale.languageCode]!['all'];
  }
  String? get latest {
    return _localizedValues[locale.languageCode]!['latest'];
  }
  String? get older {
    return _localizedValues[locale.languageCode]!['older'];
  }

  String? get addPostToDiscussion {
    return _localizedValues[locale.languageCode]!['addPostToDiscussion'];
  }

  String? get addToIndicateTrainer {
    return _localizedValues[locale.languageCode]!['addToIndicateTrainer'];
  }


  String? get orderDetails {
    return _localizedValues[locale.languageCode]!['orderDetails'];
  }


  String? get paying {
    return _localizedValues[locale.languageCode]!['paying'];
  }

  String? get remainingTime {
    return _localizedValues[locale.languageCode]!['remainingTime'];
  }



}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'id',
        'pt',
        'fr',
        'es',
        'tk',
        'sw',
        'it',
        'fa'
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {

    if (kDebugMode) {
      print(locale);
    }
    lang = locale.toString();
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

int getCurrentLanguage(Locale locale) {
  if (locale == const Locale('en')) {
    return 0;
  } else if (locale == const Locale('ar')) {
    return 1;
  } else if (locale == const Locale('fr')) {
    return 2;
  } else if (locale == const Locale('id')) {
    return 3;
  } else if (locale == const Locale('pt')) {
    return 4;
  } else if (locale == const Locale('es')) {
    return 5;
  } else if (locale == const Locale('it')) {
    return 6;
  } else if (locale == const Locale('tr')) {
    return 7;
  } else if (locale == const Locale('sw')) {
    return 8;
  } else {
    return -1;
  }
}
