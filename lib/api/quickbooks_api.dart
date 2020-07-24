

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class IntuitAPI {


	static const String devId = 'ABDkQVAOolk9XZ7dW2G8V1kNLsdFbBhhAIluVwBKQa7AqiHhkr';
	static const String productionId = 'AB9ewa1WvuCJ4ZI6ghDefF4yW5SO1ax6VrZ8TL96QyweVF4GyP';
	static const String clientSecret = '5Zz7O1s3Y8zSEFiBXHoU8ft7ZABkSuuE3jsiJv6r';
	static const String appId = 'djQuMTo6OGQzYmJlYTI3Yg:002a968c-102a-4630-b236-01e0493c24a5';


	intuitLogin() async {
		FlutterAppAuth appAuth = FlutterAppAuth();

		final AuthorizationTokenResponse result = await appAuth.authorizeAndExchangeCode(
			AuthorizationTokenRequest(
				devId,
				'https://ts-landscaping.firebaseapp.com/',
				discoveryUrl: 'https://appcenter.intuit.com/connect/oauth2',
				additionalParameters: {'response_type':'code',
				'state': appId },
				scopes: ['openid','profile', 'email', 'phone', 'address'],
			),
		);
		print(result);
	}


}