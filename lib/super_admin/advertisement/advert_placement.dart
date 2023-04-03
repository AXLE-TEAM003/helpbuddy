import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpbuddy/utils/constant/theme.dart';
import 'package:helpbuddy/widget/button.dart';
import 'package:helpbuddy/widget/input/outlineInput.dart';


class AdvertPlacement extends StatefulWidget {
  const AdvertPlacement({Key? key}) : super(key: key);

  @override
  _AdvertPlacementState createState() => _AdvertPlacementState();
}

class _AdvertPlacementState extends State<AdvertPlacement> {
  TextEditingController? emailController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loginPasswordVisibility = false;

  final bool _value = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 16,
          ),
        ),
        title: Text('Advert Placement',
            style: GoogleFonts.urbanist(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Colors.black)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Add Image',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(label: 'Click here to add photo', suffixWidget: const Icon(Icons.add),),
                const SizedBox(
                  height: 20,
                ),
                Button(text: 'Upload'),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Add Video',
                        textAlign: TextAlign.start,
                        style: ConstantTheme().defaultStyle),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BlackOutlineInput(label: 'Click here to add photo',suffixWidget: const Icon(Icons.add),),
                const SizedBox(
                  height: 20,
                ),
                Button(text: 'Upload'),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //   void Resendpin() async {
  //   Loading(context);
  //   HttpRequest('/email-verification',
  //   shouldPopOnError: false,
  //       context: context,
  //       body: {'email': widget.email}, onSuccess: (_, result) {
  //     Navigator.pop(context);
  //     successfulshowSnackbar(context, 'Sent');
  //   }, onFailure: (_, result) {
  //     Navigator.pop(context);
  //     showSnackbar(context, result['message']);
  //     return null;
  //   }, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer ${token.toString()}'
  //   }).send();
  // }
}
