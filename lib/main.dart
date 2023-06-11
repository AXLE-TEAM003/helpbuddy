import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpbuddy/admin/Request/request_history.dart';
import 'package:helpbuddy/admin/home/admin_dashboard.dart';
import 'package:helpbuddy/admin/home/project_requests.dart';
import 'package:helpbuddy/admin/home/view_more.dart';
import 'package:helpbuddy/admin/messages/messages.dart';
import 'package:helpbuddy/admin/more/profile/profile.dart';
import 'package:helpbuddy/admin/reviews/reviews.dart';
import 'package:helpbuddy/mymodels/myusermodels.dart';
import 'package:helpbuddy/super_admin/withdrawal/add_bank_account.dart';
import 'package:helpbuddy/super_admin/withdrawal/withdraw.dart';
import 'package:helpbuddy/authentications/forget_password.dart';
import 'package:helpbuddy/authentications/logins/super_admin_login.dart';
import 'package:helpbuddy/authentications/logins/user_login.dart';
import 'package:helpbuddy/authentications/select_role.dart';
import 'package:helpbuddy/authentications/signup.dart';
import 'package:helpbuddy/onboarding/onboarding.dart';
import 'package:helpbuddy/onboarding/splashscreen.dart';
import 'package:helpbuddy/referral_link/refer.dart';
import 'package:helpbuddy/super_admin/advertisement/advert_placement.dart';
import 'package:helpbuddy/super_admin/home/super_admin_dashboard.dart';
import 'package:helpbuddy/super_admin/more/more.dart';
import 'package:helpbuddy/super_admin/more/settings.dart';
import 'package:helpbuddy/super_admin/notification/notification.dart';
import 'package:helpbuddy/super_admin/stat/admin_stat.dart';
import 'package:helpbuddy/super_admin/stat/all_stat.dart';
import 'package:helpbuddy/super_admin/stat/message_stat.dart';
import 'package:helpbuddy/super_admin/stat/project_stat.dart';
import 'package:helpbuddy/super_admin/stat/transac_stat.dart';
import 'package:helpbuddy/super_admin/stat/user_stat.dart';
import 'package:helpbuddy/user/history/history.dart';
import 'package:helpbuddy/user/home/dashboard.dart';
import 'package:helpbuddy/user/messages/messages.dart';
import 'package:helpbuddy/user/more/user_more.dart';
import 'package:helpbuddy/user/notification/notification.dart';
import 'package:helpbuddy/user/payment/bank_state.dart';
import 'package:helpbuddy/user/payment/make_payment.dart';
import 'package:helpbuddy/user/profile/profile.dart';
import 'package:helpbuddy/user/project/project.dart';
import 'package:provider/provider.dart';

import 'admin/history/history.dart';
import 'authentications/logins/admin_login.dart';
import 'super_admin/messages/messages.dart';
import 'user/history/inside_history.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Set up the listener for foreground messages
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

  runApp(const MyApp());
}

// Background message handler (called when the app is in the background)
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print('Handling a background message: ${message.messageId}');
//   // Handle the message and show a notification
//   // You can use a package like flutter_local_notifications to display the notification
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BankState>(
          create: (BuildContext context) => BankState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twgo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          // Onboarding Routes ...
          '/splash': (context) => const Splashscreen(),
          '/onboarding': (context) => const Onboarding(),
          '/signup': (context) => const SignUp(),
          '/select-role': (context) => const SelectRole(),
          '/user-login': (context) => const UserLogin(),
          '/admin-login': (context) => const AdminLogin(),
          '/super-admin-login': (context) => const SuperAdminLogin(),
          '/forgot-password': (context) => const ForgotpasswordWidget(),
          '/referral-link': (context) => const Refer(),
          '/request-history': (context) => requestHistory2(context),

          // User Routes ...
          '/user/dashboard': (context) => dash(context),
          '/user/notification': (context) => notifications(context),
          '/user/profile': (context) => prof(context),
          '/user/add-balance/make-payment': (context) => const MakePayments(),
          '/user/history': (context) => history(context),
          '/user/history-detail': (context) => historyDetails(context),
          '/user/more': (context) => userMore(context),
          '/user/project': (context) => project(context),
          '/user/side-bar/messages': (context) => userMessages(context),
          '/user/side-bar/notification': (context) => notifications(context),
          '/user/side-bar/profile': (context) => prof(context),

          // Admin Routes ...
          '/admin/dashboard': (context) => dashA(context),
          '/admin/notification': (context) => notificationsA(context),
          '/admin/profile': (context) => profA(context),
          '/admin/project-requests': (context) => projectRequests(context),
          '/admin/history': (context) => requestHistory(context),
          '/admin/reviews': (context) => const Reviews(),
          '/admin/more': (context) => viewMore(context),
          '/admin/side-bar/messages': (context) => adminMessages(context),
          '/admin/side-bar/notification': (context) => notificationsA(context),
          '/admin/side-bar/profile': (context) => profA(context),

          // Super Admin Routes ...
          '/super-admin/dashboard': (context) => dashSA(context),
          '/super-admin/all-stats/project-stats': (context) =>
              const ProjectStat(),
          '/super-admin/withdrawal': (context) => const Withdrawal(),
          '/super-admin/withdrawal/add-bank-account': (context) =>
              const AddBankAccount(),
          '/super-admin/all-stats/message-stats': (context) =>
              const MessageStat(),
          '/super-admin/all-stats/transaction-stats': (context) =>
              const TransactionStat(),
          '/super-admin/all-stats/user-stats': (context) => const UserStat(),
          '/super-admin/notification': (context) => notificationsSA(context),
          '/super-admin/stats': (context) => const AdminStat(),
          '/super-admin/user-stats': (context) => const UserStat(),
          '/super-admin/all-stats': (context) => const AllStat(),
          '/super-admin/more': (context) => superMore(context),
          '/super-admin/more/advert': (context) => const AdvertPlacement(),
          '/super-admin/more/settings': (context) => const SuperAdminSettings(),
          '/super-admin/side-bar/messages': (context) =>
              superAdminMessages(context),
        },
      ),
    );
  }
}

Widget requestHistory(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return AdminHistory(
        token: token,
      );
    },
  );
}

Widget requestHistory2(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return RequestHistory(
        token: token,
      );
    },
  );
}

Widget superMore(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final info = args['info'] as UserInfo;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return SuperAdminMore(
        userInfo: info,
        token: token,
      );
    },
  );
}

Widget viewMore(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final info = args['info'] as UserInfo;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return ViewMore(
        userInfo: info,
        token: token,
      );
    },
  );
}

Widget userMore(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final info = args['info'] as UserInfo;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return UserMore(
        userInfo: info,
        token: token,
      );
    },
  );
}

Widget userMessages(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;
      final uid = args['uid'] as int;

      // Return the ChatRoom widget with the required parameters
      return UserMessages(
        token: token,
        uid: uid,
      );
    },
  );
}

Widget adminMessages(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;
      final uid = args['uid'] as int;

      // Return the ChatRoom widget with the required parameters
      return AdminMessages(
        token: token,
        uid: uid,
      );
    },
  );
}

Widget superAdminMessages(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;
      final uid = args['uid'] as int;

      // Return the ChatRoom widget with the required parameters
      return SuperAdminMessages(
        token: token,
        uid: uid,
      );
    },
  );
}

Widget notifications(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return UserNotification(token: token);
    },
  );
}

Widget notificationsA(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return UserNotification(token: token);
    },
  );
}

Widget notificationsSA(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return SuperAdminNotification();
    },
  );
}

Widget history(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return History(token: token);
    },
  );
}

Widget historyDetails(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;
      final project = args['project'] as Project;

      // Return the ChatRoom widget with the required parameters
      return HistoryDetail(token: token, project: project);
    },
  );
}

Widget projectRequests(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;
      final uid = args['uid'] as int;

      // Return the ChatRoom widget with the required parameters
      return ProjectRequests(token: token, uid: uid);
    },
  );
}

Widget dash(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return UserDashboard(token: token);
    },
  );
}

Widget dashA(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return AdminDashboard(token: token);
    },
  );
}

Widget dashSA(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return SuperAdminDashboard(token: token);
    },
  );
}

Widget prof(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final info = args['info'] as UserInfo;

      // Return the ChatRoom widget with the required parameters
      return UserProfile(userInfo: info);
    },
  );
}

Widget profA(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final info = args['info'] as UserInfo;

      // Return the ChatRoom widget with the required parameters
      return AdminProfile(userInfo: info);
    },
  );
}

Widget project(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final token = args['token'] as String;

      // Return the ChatRoom widget with the required parameters
      return UserProject(token: token);
    },
  );
}
