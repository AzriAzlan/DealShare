import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {

  final GlobalKey<NavigatorState> _navigationService = new GlobalKey<NavigatorState>();
  String dealId;
  String referrer;

  Future handleDynamicLinks() async {
    // Get initial dynamic link if the app is started using the link
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();

    _handleDeepLink(data);

    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
        _handleDeepLink(dynamicLinkData);
      },
      onError: (OnLinkErrorException e) {
        // Gg
      }
    );
  }

  bool _handleDeepLink(PendingDynamicLinkData data) { // Have link
    final Uri deepLink = data?.link;
    if(deepLink != null) {

      var isDeal = deepLink.toString().contains('deal');

      if (isDeal) {
        dealId = deepLink.queryParameters['deal'];
        referrer = deepLink.queryParameters['ref'];

        if (dealId != null || referrer != null) {
          return true;
        }
        else {
          return false;
        }
      }
    }
    else { // No link
      //print('FUCK');
    }
  }

  Future<String> createShareLink(String dealId, String sharerId) async {

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://azriazlandealshare.page.link',
      link: Uri.parse('https://azriazlandealshare.page.link/?deal=$dealId&ref=$sharerId'),
      androidParameters: AndroidParameters(
          packageName: 'com.azriazlan.dealshare',
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    return dynamicUrl.toString();
  }

  String getDealId() {
    return dealId;
  }

  String getReferrerId() {
    return referrer;
  }

}