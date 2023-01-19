import 'package:firebase_admob/firebase_admob.dart';
import 'package:zodiac/utils/utils.dart';

class AdsProvider extends ChangeNotifier {

  factory AdsProvider() {
    if (_this == null) _this = AdsProvider._();
    return _this;
  }
  static AdsProvider _this;
  AdsProvider._() : super();

  String getAppId() {
    return 'ca-app-pub-8032453967263891~5445897679';
  }
  
  BannerAd createBannerAdUnitId(){
  return BannerAd(
  adUnitId: 'ca-app-pub-8032453967263891/9345436621',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);
}



NativeAd createNativeAd() {
    return NativeAd(
      adUnitId: NativeAd.testAdUnitId,
      factoryId: 'adFactoryExample',
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("$NativeAd event $event");
      },
    );
  }


   static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Aries', 'zodiacbook'],
    contentUrl: 'https://flutter.io',
    // birthday: DateTime.now(),
    childDirected: false,
    // designedForFamilies: false,
    // gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );




}
